//
//  Session.swift
//  SplatNetDemo
//
//  Created by devonly on 2022/11/27.
//

import Foundation
import SplatNet3

public class Session: SplatNet3 {
    override public func getAllCoopHistoryDetailQuery() async throws -> [CoopResult] {
        let results: [CoopResult] = try await super.getAllCoopHistoryDetailQuery()
        await RealmService.shared.save(results)
        return results
    }
}
