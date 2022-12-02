//
//  SplatNet3.swift
//
//
//  Created by devonly on 2022/11/22.
//

import Foundation
import Alamofire

open class SP3Session: SPSession, Authenticator {
    public typealias Credential = UserInfo

    public func apply(_ credential: UserInfo, to urlRequest: inout URLRequest) {
        if let bulletToken: String = credential.bulletToken {
            urlRequest.headers.add(.authorization(bearerToken: bulletToken))
        }
    }

    public func refresh(_ credential: UserInfo, for session: Alamofire.Session, completion: @escaping (Result<UserInfo, Error>) -> Void) {
        let session: SPSession = SPSession()
        Task {
            do {
                let account: UserInfo = try await session.refresh(contentId: .SP3)
                completion(.success(account))
            } catch(let error) {
                completion(.failure(error))
            }
        }
    }

    public func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: UserInfo) -> Bool {
        return false
    }

    public func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
        return response.statusCode == 401
    }

    func request<T: RequestType>(_ request: T) async throws -> T.ResponseType {
        let interceptor: AuthenticationInterceptor<SP3Session>? = {
            guard let account = account else {
                return nil
            }
            return AuthenticationInterceptor(authenticator: self, credential: account)
        }()
        return try await session.request(request, interceptor: interceptor)
            .serializingDecodable(T.ResponseType.self, decoder: decoder)
            .value
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
        let result: CoopHistoryDetailQuery.CoopHistoryDetail = try await request(CoopHistoryDetailQuery(resultId: result.id)).data.coopHistoryDetail
        return CoopResult(history: schedule, content: result)
    }

    open func getAllCoopHistoryDetailQuery() async throws -> [CoopResult] {
        let nodes: [CoopHistoryQuery.HistoryGroup] = try await getCoopHistoryQuery().historyGroups.nodes
        let resultIds: [String] = nodes.flatMap({ $0.historyDetails.nodes.map({ $0.id }) })
        // 最大値の設定
        DispatchQueue.main.async(execute: {
            self.requests.append(SPProgress(.COOP_RESULT))
        })
        let response: [CoopResult] = try await withThrowingTaskGroup(of: CoopResult.self, body: { task in
            /// リクエストの追加
            nodes.forEach({ node in
                node.historyDetails.nodes.forEach({ result in
                    task.addTask(operation: { [self] in
                        return try await getCoopHistoryDetailQuery(schedule: node.asSchedule(), result: result)
                    })
                })
            })

            /// リクエストの実行
            return try await task.reduce(into: [CoopResult]()) { results, result in
                results.append(result)
                let count: Int = results.count
            }
        })
        DispatchQueue.main.async(execute: {
            self.requests.success()
        })
        return response
    }
}
