//
//  CoopHistoryDetailQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import SplatNet

public final class CoopHistoryDetailQuery: GraphQL {
	public typealias ResponseType = Response

	public var hash: SHA256Hash = .CoopHistoryDetailQuery
	public var variables: [String: String] = [:]
	public var parameters: Parameters?

    init(resultId: String) {
        self.variables = [
            "coopHistoryDetailId": resultId
        ]
    }

    // MARK: - Response
    public struct Response: Codable {
        public let data: DataClass
    }

    // MARK: - DataClass
    public struct DataClass: Codable {
        public let coopHistoryDetail: CoopHistoryDetail
    }

    // MARK: - CoopHistoryDetail
    public struct CoopHistoryDetail: Codable {
        public let id: String
        public let afterGrade: GradeType?
        public let rule: RuleType
        public let myResult: MemberResult
        public let memberResults: [MemberResult]
        public let bossResult: CoopHistory.BossResult?
        public let enemyResults: [EnemyResult]
        public let waveResults: [WaveResult]
        public let resultWave: Int
        public let playedTime: Date
        public let coopStage: CoopStageType
        public let dangerRate: Double
        public let scenarioCode: String?
        public let smellMeter: Int?
        public let weapons: [WeaponType]
        public let afterGradePoint: Int?
        public let scale: CoopHistory.Scale?
        public let jobPoint: Int?
        public let jobScore: Int?
        public let jobRate: Double?
        public let jobBonus: Int?
        public let nextHistoryDetail: CoopHistory.HistoryDetailElement?
        public let previousHistoryDetail: CoopHistory.HistoryDetailElement?
    }

    // MARK: - Image
    public struct Image<T: RawRepresentable>: Codable where T.RawValue == String {
        @SHA256HashRawValue public var url: T
    }

    // MARK: - EnemyResult
    public struct EnemyResult: Codable {
        public let defeatCount: Int
        public let teamDefeatCount: Int
        public let popCount: Int
        public let enemy: EnemyType
    }

    // MARK: - MemberResult
    public struct MemberResult: Codable {
        public let player: ResultPlayer
        public let weapons: [WeaponType]
        public let specialWeapon: SpecialType?
        public let defeatEnemyCount: Int
        public let deliverCount: Int
        public let goldenAssistCount: Int
        public let goldenDeliverCount: Int
        public let rescueCount: Int
        public let rescuedCount: Int
    }

    // MARK: - ResultPlayer
    public struct ResultPlayer: Codable {
        public let byname: String
        public let name: String
        public let nameId: String
        public let nameplate: Nameplate
        public let uniform: SkinType
        public let id: String
        public let isMyself: Bool
        public let species: SpeciesType
    }

    // MARK: - Nameplate
    public struct Nameplate: Codable {
        public let badges: [Badge?]
        public let background: Background
    }

    // MARK: - Background
    public struct Background: Codable {
        public let textColor: Common.TextColor
        public let image: Image<NameplateKey>
        @IntegerRawValue public var id: NameplateId
    }

    // MARK: - Badge
    public struct Badge: Codable {
        @IntegerRawValue public var id: BadgeId
        public let image: Image<BadgeKey>
    }

    // MARK: - WaveResult
    public struct WaveResult: Codable {
        public let waveNumber: Int
        public let waterLevel: WaterLevelId
        public let eventWave: CoopHistory.Element<EventId>?
        public let deliverNorm: Int?
        public let goldenPopCount: Int
        public let teamDeliverCount: Int?
        public let specialWeapons: [SpecialType]
    }
}
