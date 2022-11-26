//
//  CoopHistoryQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import Common

public protocol PartialHistoryGroup: Codable {
    var startTime: Date? { get }
    var endTime: Date? { get }
    var mode: ModeType { get }
    var rule: RuleType { get }
}

public final class CoopHistoryQuery: GraphQL {
	public typealias ResponseType = CoopHistoryQuery.Response
    public var hash: SHA256Hash = .CoopHistoryQuery
    public var variables: [String: String] = [:]
    public var parameters: Parameters?

	init() {}

    // MARK: - Response
    public struct Response: Codable {
        public let data: DataClass
    }

    // MARK: - DataClass
    public struct DataClass: Codable {
        public let coopResult: CoopResult
    }

    // MARK: - CoopResult
    public struct CoopResult: Codable {
        public let historyGroupsOnlyFirst: Common.Node<HistoryGroupsOnlyFirstNode>
        public let regularAverageClearWave: Double
        public let regularGrade: GradeType
        public let regularGradePoint: Int
        public let monthlyGear: GearType
        public let scale: CoopHistory.Scale
        public let pointCard: PointCard
        public let historyGroups: Common.Node<HistoryGroup>
    }

    // MARK: - CoopSchedule
    public struct CoopSchedule: PartialHistoryGroup {
        public let startTime: Date?
        public let endTime: Date?
        public let mode: ModeType
        public let rule: RuleType

        init(history: HistoryGroup) {
            self.startTime = history.startTime
            self.endTime = history.endTime
            self.mode = history.mode
            self.rule = history.rule
        }
    }

    // MARK: - HistoryGroup
    public struct HistoryGroup: PartialHistoryGroup {
        public let startTime: Date?
        public let endTime: Date?
        public let mode: ModeType
        public let rule: RuleType
        public let highestResult: HighestResult?
        public let historyDetails: Common.Node<HistoryDetail>
    }

    // MARK: - HighestResult
    public struct HighestResult: Codable {
        public let grade: GradeType
        public let gradePoint: Int
        public let jobScore: Int
    }

    // MARK: - HistoryDetail
    public struct HistoryDetail: Codable {
        public let id: String
        public let weapons: [WeaponType]
        public let nextHistoryDetail: CoopHistory.HistoryDetailElement?
        public let previousHistoryDetail: CoopHistory.HistoryDetailElement?
        public let resultWave: Int
        public let coopStage: CoopHistory.Element<CoopStageId>
        public let afterGrade: GradeType?
        public let afterGradePoint: Int?
        public let gradePointDiff: GradePointDiff?
        public let bossResult: CoopHistory.BossResult?
        public let myResult: Result
        public let memberResults: [Result]
        public let waveResults: [WaveResult]
    }

    public enum GradePointDiff: String, Codable {
        case down   = "DOWN"
        case keep   = "KEEP"
        case up     = "UP"
    }

    // MARK: - Result
    public struct Result: Codable {
        public let deliverCount: Int
        public let goldenDeliverCount: Int
    }

    // MARK: - WaveResult
    public struct WaveResult: Codable {
        public let waveNumber: Int
    }

    // MARK: - HistoryGroupsOnlyFirstNode
    public struct HistoryGroupsOnlyFirstNode: Codable {
        public let historyDetails: Common.Node<CoopHistory.HistoryDetailElement>
    }

    // MARK: - PointCard
    public struct PointCard: Codable {
        public let defeatBossCount: Int
        public let deliverCount: Int
        public let goldenDeliverCount: Int
        public let playCount: Int
        public let rescueCount: Int
        public let regularPoint: Int
        public let totalPoint: Int
    }
}

extension CoopHistoryQuery.HistoryGroup {
    func asSchedule() -> CoopHistoryQuery.CoopSchedule {
        CoopHistoryQuery.CoopSchedule(history: self)
    }
}
