//
//  SplatNet3.swift
//  
//
//  Created by devonly on 2022/11/22.
//

import Foundation
import Common

open class SplatNet3: SPSession {
    /// バイトりれきを取得
    public func getCoopHistoryQuery() async throws -> CoopHistoryQuery.Response {
        return try await request(CoopHistoryQuery())
    }

    /// フレンドリストを取得
    public func getFriendListQuery() async throws -> FriendListQuery.Response {
        try await request(FriendListQuery())
    }

    /// バイトりれき詳細を取得
    private func getCoopHistoryDetailQuery(resultId: String) async throws -> CoopHistoryDetailQuery.Response {
        try await request(CoopHistoryDetailQuery(resultId: resultId))
    }

    /// スケジュール取得
    public func getStageScheduleQuery() async throws -> StageScheduleQuery.Response {
        try await request(StageScheduleQuery())
    }

    /// バイトりれき詳細を一括取得
    public func getAllCoopHistoryDetailQuery() async throws -> [CoopHistoryDetailQuery.Response] {
        /// バイトりれきを取得
        let history: CoopHistoryQuery.Response = try await getCoopHistoryQuery()
        let resultIds: [String] = history.data.coopResult.historyGroups.nodes.flatMap({ $0.historyDetails.nodes.map({ $0.id }) })
        return try await withThrowingTaskGroup(of: CoopHistoryDetailQuery.Response.self, body: { task in
            resultIds.forEach({ resultId in
                task.addTask(operation: { [self] in
                    try await getCoopHistoryDetailQuery(resultId: resultId)
                })
            })

            return try await task.reduce(into: [CoopHistoryDetailQuery.Response]()) { results, result in
                results.append(result)
            }
        })
    }
}
