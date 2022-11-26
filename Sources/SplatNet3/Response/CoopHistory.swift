//
//  CoopHistory.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation
import Common

public enum CoopHistory {
    // MARK: - Scale
    public struct Scale: Codable {
        public let gold: Int
        public let silver: Int
        public let bronze: Int
    }

    // MARK: - Content
    public struct Content<T: RawRepresentable, S: RawRepresentable>: Codable where T.RawValue == String, S.RawValue == Int {
        public let name: String
        @IntegerRawValue public var id: S
        public let image: Common.URL<T>
    }

    // MARK: - Element
    public struct Element<T: RawRepresentable>: Codable where T.RawValue == Int {
        public let name: String
        @IntegerRawValue public var id: T
    }

    // MARK: - BossResult
    public struct BossResult: Codable {
        public let hasDefeatBoss: Bool
        public let boss: CoopHistory.Element<EnemyId>
    }

    // MARK: - HistoryDetailElement
    public struct HistoryDetailElement: Codable {
        public let id: String
    }
}
