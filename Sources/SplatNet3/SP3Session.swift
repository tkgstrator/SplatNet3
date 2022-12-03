//
//  SPSessionr.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

//public protocol SP3RequestDelegate: AnyObject {
//    func getAllCoopHistoryDetailQuery() async throws -> [CoopResult]
//}

/// SP3用のセッションクラス
open class SP3Session: Session,  ObservableObject {
    public typealias Credential = UserInfo
    public typealias Completion = (Float, Float) -> Void

    @Published var requests: [SPProgress] = []

    public override init() {}

    override func request(_ request: IksmSession) async -> [String : String]? {
        DispatchQueue.main.async(execute: {
            self.requests.append(SPProgress(request))
        })
        let response: [String: String]? = await super.request(request)
        DispatchQueue.main.async(execute: {
            self.requests.success()
        })
        return response
    }

    override open func request<T>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> T.ResponseType where T : RequestType {
        do {
            DispatchQueue.main.async(execute: {
                self.requests.append(SPProgress(request))
            })
            let response: T.ResponseType = try await super.request(request)
            DispatchQueue.main.async(execute: {
                self.requests.success()
            })
            return response
        } catch(let error) {
            DispatchQueue.main.async(execute: {
                self.requests.failure()
            })
            throw error
        }
    }

    override open func request<T>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> String where T : RequestType {
        do {
            DispatchQueue.main.async(execute: {
                self.requests.append(SPProgress(request))
            })
            let response: String = try await super.request(request)
            DispatchQueue.main.async(execute: {
                self.requests.success()
            })
            return response
        } catch(let error) {
            DispatchQueue.main.async(execute: {
                self.requests.failure()
            })
            throw error
        }
    }

    @discardableResult
    public func getAllCoopStageScheduleQuery() async throws -> [CoopSchedule] {
        return try await request(CoopStageScheduleQuery())
    }

    @discardableResult
    open func getCoopStageScheduleQuery() async throws -> [CoopSchedule] {
        return try await request(StageScheduleQuery()).data.coopGroupingSchedule.regularSchedules.nodes.map({ CoopSchedule(schedule: $0) })
    }

    @discardableResult
    open func getAllCoopHistoryDetailQuery(playTime: Date? = nil, completion: Completion) async throws -> [CoopResult] {
        completion(0, 1)
        let nodes: [CoopHistoryQuery.HistoryGroup] = try await getCoopHistoryQuery().historyGroups.nodes
        let resultIds: [Common.ResultId] = {
            if let playTime = playTime {
                return nodes.flatMap({ $0.historyDetails.nodes.map({ $0.id }) }).filter({ $0.playTime > playTime })
            }
            return nodes.flatMap({ $0.historyDetails.nodes.map({ $0.id }) })
        }()

        if resultIds.isEmpty {
            completion(1, 1)
            return []
        }

        DispatchQueue.main.async(execute: {
            self.requests.append(SPProgress(.COOP_RESULT))
        })
        let response: [CoopResult] = try await withThrowingTaskGroup(of: CoopResult.self, body: { task in
            nodes.forEach({ node in
                node.historyDetails.nodes.forEach({ result in
                    if resultIds.contains(result.id) {
                        task.addTask(operation: { [self] in
                            return try await getCoopHistoryDetailQuery(schedule: node.asSchedule(), result: result)
                        })
                    }
                })
            })

            return try await task.reduce(into: [CoopResult]()) { results, result in
                results.append(result)
                completion(Float(results.count), Float(resultIds.count))
            }
        })
        DispatchQueue.main.async(execute: {
            self.requests.success()
        })
        return response
    }
}

extension SP3Session: Authenticator {
    public func refresh(_ credential: UserInfo, for session: Alamofire.Session, completion: @escaping (Result<UserInfo, Error>) -> Void) {
        Task {
            let session: SP3Session = SP3Session()
            do {
                let account: UserInfo = try await session.refresh(contentId: .SP3)
                completion(.success(account))
            } catch (let error) {
                completion(.failure(error))
            }
        }
    }

    public func apply(_ credential: UserInfo, to urlRequest: inout URLRequest) {
        if let bulletToken: String = credential.bulletToken {
            urlRequest.headers.add(.authorization(bearerToken: bulletToken))
        }
    }

    public func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
        return response.statusCode == 401
    }

    public func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: UserInfo) -> Bool {
        return false
    }

    private func request<T>(_ request: T) async throws -> T.ResponseType where T : GraphQL {
        let interceptor: AuthenticationInterceptor<SP3Session>? = {
            guard let account = account else {
                return nil
            }
            return AuthenticationInterceptor(authenticator: self, credential: account)
        }()
        do {
            DispatchQueue.main.async(execute: {
                if request.hash != .CoopHistoryDetailQuery {
                    self.requests.append(SPProgress(request))
                }
            })
            let response: T.ResponseType = try await session.request(request, interceptor: interceptor)
                .validationWithNXError()
                .serializingDecodable(T.ResponseType.self, decoder: decoder)
                .value
            DispatchQueue.main.async(execute: {
                if request.hash != .CoopHistoryDetailQuery {
                    self.requests.success()
                }
            })
            return response
        } catch(let error) {
            DispatchQueue.main.async(execute: {
                if request.hash != .CoopHistoryDetailQuery {
                    self.requests.failure()
                }
            })
            throw error
        }
    }

    private func getCoopStageScheduleQuery() async throws -> [StageScheduleQuery.CoopSchedule] {
        return try await request(StageScheduleQuery()).data.coopGroupingSchedule.regularSchedules.nodes
    }

    private func getCoopHistoryQuery() async throws -> CoopHistoryQuery.CoopResult {
        return try await request(CoopHistoryQuery()).data.coopResult
    }

    private func getCoopHistoryDetailQuery(resultId: String) async throws -> CoopHistoryDetailQuery.CoopHistoryDetail {
        return try await request(CoopHistoryDetailQuery(resultId: resultId)).data.coopHistoryDetail
    }

    private func getCoopHistoryDetailQuery(
        schedule: CoopHistoryQuery.CoopSchedule,
        result: CoopHistoryQuery.HistoryDetail
    ) async throws -> CoopResult {
        let result: CoopHistoryDetailQuery.CoopHistoryDetail = try await request(CoopHistoryDetailQuery(resultId: result.id.description)).data.coopHistoryDetail
        return CoopResult(history: schedule, content: result)
    }
}
