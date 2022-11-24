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

final class CoopHistoryQuery: GraphQL {
	public typealias ResponseType = CoopHistoryQuery.Response
	var hash: SHA256Hash = .CoopHistoryQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

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
        public let historyGroupsOnlyFirst: HistoryGroupsOnlyFirst
        public let regularAverageClearWave: Double
        public let regularGrade: RegularGrade
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
        public let grade: RegularGrade
        public let gradePoint: Int
        public let jobScore: Int
    }

    // MARK: - RegularGrade
    public struct RegularGrade: Codable {
        public let name: RegularGradeName
        public let id: ID
    }

    public enum ID: String, Codable {
        case q29VcEVuZW15LTIz   = "Q29vcEVuZW15LTIz"
        case q29VcEdyYWRlLTg    = "Q29vcEdyYWRlLTg="
        case q29VcFN0YWdlLTI    = "Q29vcFN0YWdlLTI="
        case q29VcFN0YWdlLTc    = "Q29vcFN0YWdlLTc="
    }

    public enum RegularGradeName: String, Codable {
        case でんせつ = "でんせつ"
        case アラマキ砦 = "アラマキ砦"
        case ムニエル海洋発電所 = "ムニ・エール海洋発電所"
        case ヨコヅナ = "ヨコヅナ"
    }

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
        public let coopStage: RegularGrade
        public let afterGrade: RegularGrade?
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
        public let boss: RegularGrade
    }

    public enum GradePointDiff: String, Codable {
        case down = "DOWN"
        case keep = "KEEP"
        case up = "UP"
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
        public let name: WeaponName
        public let image: Image
    }

    // MARK: - Image
    public struct Image: Codable {
        public let url: String
    }

    public enum WeaponName: String, Codable {
        case lact450 = "LACT-450"
        case the96ガロン = ".96ガロン"
        case クラッシュブラスタ = "クラッシュブラスター"
        case ドライブワイパ = "ドライブワイパー"
        case バケットスロッシャ = "バケットスロッシャー"
        case ボルドマカ = "ボールドマーカー"
        case ランダム = "ランダム"
    }

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
