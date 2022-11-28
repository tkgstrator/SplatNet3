//
//  ChallengeRefetchQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import SplatNet

final class ChallengeRefetchQuery: GraphQL {
	public typealias ResponseType = ChallengeRefetchQuery.Response
	var hash: SHA256Hash = .ChallengeRefetchQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

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
        public let typename: String
        public let id: String
        public let afterGrade: AfterGrade
        public let rule: String
        public let myResult: MemberResult
        public let memberResults: [MemberResult]
        public let bossResult: BossResult
        public let enemyResults: [EnemyResult]
        public let waveResults: [WaveResult]
        public let resultWave: Int
        public let playedTime: String
        public let coopStage: CoopStage
        public let dangerRate: Double
//        public let scenarioCode: JSONNull?
        public let smellMeter: Int
        public let weapons: [Weapon]
        public let afterGradePoint: Int
        public let scale: Scale
        public let jobPoint: Int
        public let jobScore: Int
        public let jobRate: Double
        public let jobBonus: Int
//        public let nextHistoryDetail: JSONNull?
//        public let previousHistoryDetail: PreviousHistoryDetail
    }

    // MARK: - AfterGrade
    public struct AfterGrade: Codable {
        public let name: String
        public let id: String
    }

    // MARK: - BossResult
    public struct BossResult: Codable {
        public let hasDefeatBoss: Bool
        public let boss: CoopStage
    }

    // MARK: - CoopStage
    public struct CoopStage: Codable {
        public let name: String
        public let id: String
        public let image: Image
    }

    // MARK: - Image
    public struct Image: Codable {
        public let url: String
    }

    // MARK: - EnemyResult
    public struct EnemyResult: Codable {
        public let defeatCount: Int
        public let teamDefeatCount: Int
        public let popCount: Int
        public let enemy: CoopStage
    }

    // MARK: - MemberResult
    public struct MemberResult: Codable {
        public let player: ResultPlayer
        public let weapons: [Weapon]
        public let specialWeapon: CoopStage
        public let defeatEnemyCount: Int
        public let deliverCount: Int
        public let goldenAssistCount: Int
        public let goldenDeliverCount: Int
        public let rescueCount: Int
        public let rescuedCount: Int
    }

    // MARK: - MemberResultPlayer
    public struct ResultPlayer: Codable {
        public let isPlayer: String
        public let byname: String
        public let name: String
        public let nameID: String
        public let nameplate: Nameplate
        public let uniform: CoopStage
        public let id: String
        public let isMyself: Bool
        public let species: String
    }

    // MARK: - PurpleNameplate
    public struct Nameplate: Codable {
        public let badges: [Badge]
        public let background: Background
    }

    // MARK: - Background
    public struct Background: Codable {
        public let textColor: Common.TextColor
        public let image: Image
        public let id: String
    }

    // MARK: - Badge
    public struct Badge: Codable {
        public let id: String
        public let image: Image
    }

    // MARK: - Weapon
    public struct Weapon: Codable {
        public let name: Name
        public let image: Image
    }

    public enum Name: String, Codable {
        case lact450 = "LACT-450"
        case the96ガロン = ".96ガロン"
        case クラッシュブラスタ = "クラッシュブラスター"
        case バケットスロッシャ = "バケットスロッシャー"
    }
    
    // MARK: - PreviousHistoryDetail
    public struct PreviousHistoryDetail: Codable {
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
        public let eventWave: AfterGrade?
        public let deliverNorm: Int?
        public let goldenPopCount: Int
        public let teamDeliverCount: Int?
        public let specialWeapons: [CoopStage]
    }
}
