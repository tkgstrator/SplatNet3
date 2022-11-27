//
//  SplatNet3.swift
//  
//
//  Created by devonly on 2022/11/22.
//

import Foundation
import Alamofire
import Common

open class SplatNet3: SPSession {
    @Published private(set) var current: Double = .zero
    @Published private(set) var maximum: Double = .zero

    /// バイトりれきを取得
    public func getCoopHistoryQuery() async throws -> CoopHistoryQuery.CoopResult {
        return try await request(CoopHistoryQuery()).data.coopResult
    }

    /// フレンドリストを取得
    public func getFriendListQuery() async throws -> [FriendListQuery.FriendList] {
        try await request(FriendListQuery()).data.friends.nodes
    }

    /// バイトりれき詳細を取得
    private func getCoopHistoryDetailQuery(resultId: String) async throws -> CoopHistoryDetailQuery.CoopHistoryDetail {
        try await request(CoopHistoryDetailQuery(resultId: resultId)).data.coopHistoryDetail
    }

    /// バイトりれき詳細を取得
    private func getCoopHistoryDetailQuery(
        schedule: CoopHistoryQuery.CoopSchedule,
        result: CoopHistoryQuery.HistoryDetail
    ) async throws -> CoopResult {
        let result: CoopHistoryDetailQuery.CoopHistoryDetail = try await request(CoopHistoryDetailQuery(resultId: result.id)).data.coopHistoryDetail
        return CoopResult(history: schedule, content: result)
    }

    /// スケジュール取得
    @discardableResult
    public func getStageScheduleQuery() async throws -> StageScheduleQuery.Response {
        try await request(StageScheduleQuery())
    }

    @discardableResult
    public func getCoopStageScheduleQuery() async throws -> [StageScheduleQuery.CoopSchedule] {
        try await request(StageScheduleQuery()).data.coopGroupingSchedule.regularSchedules.nodes
    }

    /// バイトりれき詳細を一括取得
    @discardableResult
    open func getAllCoopHistoryDetailQuery() async throws -> [CoopResult] {
        DispatchQueue.main.async(execute: {
            self.maximum = 0
            self.current = 0
            self.requests.removeAll()
        })

        let nodes: [CoopHistoryQuery.HistoryGroup] = try await getCoopHistoryQuery().historyGroups.nodes
        let resultIds: [String] = nodes.flatMap({ $0.historyDetails.nodes.map({ $0.id }) })
        // 最大値の設定
        DispatchQueue.main.async(execute: {
            self.requests.append(SPProgress(.COOP_RESULT))
            self.maximum = Double(resultIds.count)
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
                // ダウンロード済みの更新
                DispatchQueue.main.async(execute: {
                    self.current = Double(count)
                })
            }
        })
        DispatchQueue.main.async(execute: {
            self.requests.success()
        })
        return response
    }

    /// AuthenticationInterceptorでリクエストを送る
    public func request<T: GraphQL>(_ request: T) async throws -> T.ResponseType {
        let interceptor: AuthenticationInterceptor<SPSession>? = {
            guard let account = self.account else {
                return nil
            }
            return AuthenticationInterceptor(authenticator: self, credential: account)
        }()

        switch request.hash {
        case .CoopHistoryDetailQuery:
            break
        case .CoopHistoryQuery, .StageScheduleQuery:
            DispatchQueue.main.async(execute: {
                self.requests.append(SPProgress(request))
            })
        default:
            break
        }

        do {
            let response = try await session.request(request, interceptor: interceptor)
                .validationWithNXError()
                .serializingDecodable(T.ResponseType.self, decoder: decoder)
                .value
            DispatchQueue.main.async(execute: {
                switch request.hash {
                case .CoopHistoryDetailQuery:
                    break
                case .CoopHistoryQuery, .StageScheduleQuery:
                    self.requests.success()
                default:
                    break
                }
            })
            #if DEBUG
//            dump(response)
            #endif
            return response
        } catch(let error) {
            DispatchQueue.main.async(execute: {
                self.requests.failure()
            })
            logger.error(error.localizedDescription)
            throw error
        }
    }
}
