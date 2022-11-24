//
//  CoopHistoryDetailQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import Common

final class CoopHistoryDetailQuery: GraphQL {
	public typealias ResponseType = CoopHistoryDetailQuery.Response
    public typealias SpecialType = Element<SpecialKey, SpecialId>
    public typealias EnemyType = Element<EnemyKey, EnemyId>
    public typealias SkinType = Element<SkinInfoKey, SkinInfoId>
	var hash: SHA256Hash = .CoopHistoryDetailQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

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
//        public let typename: String
        public let id: String
        public let afterGrade: IntegerElement<GradeId>?
        public let rule: RuleType
        public let myResult: MemberResult
        public let memberResults: [MemberResult]
        public let bossResult: BossResult?
        public let enemyResults: [EnemyResult]
        public let waveResults: [WaveResult]
        public let resultWave: Int
        public let playedTime: String
//        public let coopStage: Element
        public let dangerRate: Double
//        public let scenarioCode: JSONNull?
        public let smellMeter: Int?
        public let weapons: [Weapon]
        public let afterGradePoint: Int?
        public let scale: Scale?
        public let jobPoint: Int?
        public let jobScore: Int?
        public let jobRate: Double?
        public let jobBonus: Int?
        public let nextHistoryDetail: HistoryDetail?
        public let previousHistoryDetail: HistoryDetail?
    }

    // MARK: - IntegerElement
    public struct IntegerElement<T: RawRepresentable>: Codable where T.RawValue == Int {
        public let name: String
        @IntegerRawValue public var id: T
    }

    // MARK: - BossResult
    public struct BossResult: Codable {
        public let hasDefeatBoss: Bool
//        public let boss: Element
    }

    // MARK: - Element
    public struct Element<T: RawRepresentable, S: RawRepresentable>: Codable where T.RawValue == String, S.RawValue == Int {
        public let name: String
        @IntegerRawValue public var id: S
        public let image: Image<T>
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
        public let weapons: [Weapon]
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
//        public let isPlayer: String
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
        public let textColor: TextColor
        public let image: Image<NameplateKey>
        public let id: String
    }

    // MARK: - TextColor
    public struct TextColor: Codable {
        public let a: Double
        public let b: Double
        public let g: Double
        public let r: Double
    }

    // MARK: - Badge
    public struct Badge: Codable {
        @IntegerRawValue public var id: BadgeId
        public let image: Image<BadgeKey>
    }

    // MARK: - Weapon
    public struct Weapon: Codable {
        public let name: String
        public let image: Image<WeaponKey>
    }

    // MARK: - HistoryDetail
    public struct HistoryDetail: Codable {
        public let id: String
    }

    // MARK: - Scale
    public struct Scale: Codable {
        public let gold: Int
        public let silver: Int
        public let bronze: Int
    }

    // MARK: - WaveResult
    public struct WaveResult: Codable {
        public let waveNumber: Int
        public let waterLevel: Int
        public let eventWave: IntegerElement<EventId>?
        public let deliverNorm: Int?
        public let goldenPopCount: Int
        public let teamDeliverCount: Int?
        public let specialWeapons: [SpecialType]
    }
}
