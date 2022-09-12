//
//  CoopSummary.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire
import Common

public class CoopSummary: GraphQL {
    public typealias ResponseType = CoopSummary.Response

    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var hash: SHA256Hash = .COOP_SUMMARY
    public var variables: [String: String] = [:]

    internal init() {}

    // MARK: - CoopSummary
    public struct Response: Codable {
        public let data: DataClass
    }

    // MARK: - DataClass
    public struct DataClass: Codable {
        public let coopResult: CoopResult
    }

    // MARK: - CoopResult
    public struct CoopResult: Codable {
        public let historyGroupsOnlyFirst: HistoryGroupsOnlyFirst
        public let regularAverageClearWave: Double
        public let regularGrade: Grade
        public let regularGradePoint: Int
        public let monthlyGear: MonthlyGear
        public let scale: Scale
        public let pointCard: PointCard
        public let historyGroups: HistoryGroups
    }

    // MARK: - HistoryGroups
    public struct HistoryGroups: Codable {
        public let nodes: [HistoryGroupsNode]
    }

    // MARK: - HistoryGroupsNode
    public struct HistoryGroupsNode: Codable {
        public let startTime: String?
        public let endTime: String?
        public let mode: String
        public let rule: String
        public let highestResult: HighestResult?
        public let historyDetails: PurpleHistoryDetails
    }

    // MARK: - HighestResult
    public struct HighestResult: Codable {
        public let grade: Grade
        public let gradePoint: Int
        public let jobScore: Int
    }

    // MARK: - Grade
    public struct Grade: Codable {
        public let name: String
        @IntegerRawValue public var id: Int
    }

    //    public enum RegularGradeID: String, Codable {
    //        case q29VcEdyYWRlLTg = "Q29vcEdyYWRlLTg="
    //    }
    //
    //    public enum RegularGradeName: String, Codable {
    //        case eggsecutiveVP = "Eggsecutive VP"
    //    }

    // MARK: - PurpleHistoryDetails
    public struct PurpleHistoryDetails: Codable {
        public let nodes: [PurpleNode]
    }

    // MARK: - PurpleNode
    public struct PurpleNode: Codable {
        public let id: String
        public let weapons: [Weapon]
        public let nextHistoryDetail: NextHistoryDetailElement?
        public let previousHistoryDetail: NextHistoryDetailElement?
        public let resultWave: Int
        public let coopStage: CoopStage
        public let afterGrade: Grade?
        public let afterGradePoint: Int?
        public let gradePointDiff: GradePointDiff?
        public let bossResult: BossResult?
        public let myResult: Result
        public let memberResults: [Result]
        public let waveResults: [WaveResult]
    }

    // MARK: - BossResult
    public struct BossResult: Codable {
        public let hasDefeatBoss: Bool
        public let boss: Boss
    }

    // MARK: - Boss
    public struct Boss: Codable {
        public let name: String
        @IntegerRawValue var id: Int
    }

    // MARK: - CoopStage
    public struct CoopStage: Codable {
        public let name: String
        @IntegerRawValue public var id: Int
    }

    //    public enum CoopStageID: String, Codable {
    //        case q29VcFN0YWdlLTE = "Q29vcFN0YWdlLTE="
    //        case q29VcFN0YWdlLTc = "Q29vcFN0YWdlLTc="
    //    }
    //
    //    public enum CoopStageName: String, Codable {
    //        case goneFissionHydroplant = "Gone Fission Hydroplant"
    //        case spawningGrounds = "Spawning Grounds"
    //    }

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

    // MARK: - NextHistoryDetailElement
    public struct NextHistoryDetailElement: Codable {
        public let id: String
    }

    // MARK: - WaveResult
    public struct WaveResult: Codable {
        public let waveNumber: Int
    }

    // MARK: - Weapon
    public struct Weapon: Codable {
        public let name: String
        public let image: Image
    }

    // MARK: - Image
    public struct Image: Codable {
        @URLRawValue public var url: String
    }

    //    public enum WeaponName: String, Codable {
    //        case aerosprayMG = "Aerospray MG"
    //        case dappleDualies = "Dapple Dualies"
    //        case darkTetraDualies = "Dark Tetra Dualies"
    //        case explosher = "Explosher"
    //        case heavySplatling = "Heavy Splatling"
    //        case random = "Random"
    //        case slosher = "Slosher"
    //        case splashOMatic = "Splash-o-matic"
    //        case splatBrella = "Splat Brella"
    //        case splatanaWiper = "Splatana Wiper"
    //        case splooshOMatic = "Sploosh-o-matic"
    //    }

    // MARK: - HistoryGroupsOnlyFirst
    public struct HistoryGroupsOnlyFirst: Codable {
        public let nodes: [HistoryGroupsOnlyFirstNode]
    }

    // MARK: - HistoryGroupsOnlyFirstNode
    public struct HistoryGroupsOnlyFirstNode: Codable {
        public let historyDetails: FluffyHistoryDetails
    }

    // MARK: - FluffyHistoryDetails
    public struct FluffyHistoryDetails: Codable {
        public let nodes: [NextHistoryDetailElement]
    }

    // MARK: - MonthlyGear
    public struct MonthlyGear: Codable {
        public let typename: String
        public let name: String
        public let image: Image

        enum CodingKeys: String, CodingKey {
            case typename = "__typename"
            case name = "name"
            case image = "image"
        }
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

    // MARK: - Scale
    public struct Scale: Codable {
        public let gold: Int
        public let silver: Int
        public let bronze: Int
    }
}
