//
//  CoopResult.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

public class CoopResult: GraphQL {
    public typealias ResponseType = CoopResult.Response

    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var hash: SHA256Hash = .COOP_RESULT
    public var variables: [String: String] = [:]

    internal init(id: String) {
        self.variables = [
            "coopHistoryDetailId": id
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

    // MARK: - Rule
    public enum Rule: String, CaseIterable, Codable {
        case REGULAR = "REGULAR"
    }

    // MARK: - CoopHistoryDetail
    public struct CoopHistoryDetail: Codable {
        public let typename: String
        public let id: String
        public let afterGrade: Ref?
        public let rule: Rule
        public let myResult: PlayerResult
        public let memberResults: [PlayerResult]
        public let bossResult: BossResult?
        public let enemyResults: [EnemyResult]
        public let waveResults: [WaveResult]
        public let resultWave: Int
        public let playedTime: String
        public let coopStage: ImageRef
        public let dangerRate: Double
        public let scenarioCode: String?
        public let smellMeter: Int?
        public let weapons: [ImageRef]
        public let afterGradePoint: Int?
        public let scale: Scale?
        public let jobPoint: Int?
        public let jobScore: Int?
        public let jobRate: Double?
        public let jobBonus: Int?
        public let nextHistoryDetail: HistoryDetailId?
        public let previousHistoryDetail: HistoryDetailId?

        enum CodingKeys: String, CodingKey {
            case typename = "__typename"
            case id = "id"
            case afterGrade = "afterGrade"
            case rule = "rule"
            case myResult = "myResult"
            case memberResults = "memberResults"
            case bossResult = "bossResult"
            case enemyResults = "enemyResults"
            case waveResults = "waveResults"
            case resultWave = "resultWave"
            case playedTime = "playedTime"
            case coopStage = "coopStage"
            case dangerRate = "dangerRate"
            case scenarioCode = "scenarioCode"
            case smellMeter = "smellMeter"
            case weapons = "weapons"
            case afterGradePoint = "afterGradePoint"
            case scale = "scale"
            case jobPoint = "jobPoint"
            case jobScore = "jobScore"
            case jobRate = "jobRate"
            case jobBonus = "jobBonus"
            case nextHistoryDetail = "nextHistoryDetail"
            case previousHistoryDetail = "previousHistoryDetail"
        }
    }

    // MARK: - Scale
    public struct Scale: Codable {
        public let gold: Int
        public let silver: Int
        public let bronze: Int
    }

    // MARK: - EnemyResult
    public struct EnemyResult: Codable {
        public let defeatCount: Int
        public let teamDefeatCount: Int
        public let popCount: Int
        public let enemy: ImageRef
    }

    // MARK: - MyResult
    public struct PlayerResult: Codable {
        public let player: ResultPlayer
        public let weapons: [ImageRef]
        public let specialWeapon: ImageRef?
        public let defeatEnemyCount: Int
        public let deliverCount: Int
        public let goldenAssistCount: Int
        public let goldenDeliverCount: Int
        public let rescueCount: Int
        public let rescuedCount: Int
    }

    // MARK: - Ref
    public struct Ref: Codable {
        public let name: String
        @IntegerRawValue public var id: Int
    }

    // MARK: - BossResult
    public struct BossResult: Codable {
        public let hasDefeatBoss: Bool
        public let boss: ImageRef
    }

    // MARK: - Ref
    public struct ImageRef: Codable {
        public let name: String
        public let image: Image
        public let id: Int

        enum CodingKeys: String, CodingKey {
            case name
            case image
            case id
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            self.name = try container.decode(String.self, forKey: .name)
            self.image = try container.decode(Image.self, forKey: .image)

            // 文字列をbase64デコードして末尾の数字を取得
            if let id: String = try container.decodeIfPresent(String.self, forKey: .id),
               let data: Data = Data(base64Encoded: id),
               let decodedText: String = String(data: data, encoding: .utf8),
               let capture: String = decodedText.capture(pattern: "([0-9]*)$", group: 1),
               let intValue: Int = Int(capture)
            {
                self.id = intValue
            } else {
                let hash: String = self.image.url

                if let weaponId: Int = WeaponType(hash: hash)?.id {
                    self.id = weaponId
                } else {
                    throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "No associated Id in response."))
                }
            }
        }
    }

    // MARK: - Image
    public struct Image: Codable {
        @URLRawValue public var url: String
    }

    public enum Species: String, CaseIterable, Codable {
        case INKLING = "INKLING"
        case OCTOLING = "OCTOLING"
    }

    // MARK: - ResultPlayer
    public struct ResultPlayer: Codable {
        public let isPlayer: String
        public let byname: String
        public let name: String
        @StringAcceptable public var nameID: Int
        public let nameplate: Nameplate
        public let uniform: ImageRef
        public let id: String
        public let isMyself: Bool
        public let species: Species

        enum CodingKeys: String, CodingKey {
            case isPlayer = "__isPlayer"
            case byname = "byname"
            case name = "name"
            case nameID = "nameId"
            case nameplate = "nameplate"
            case uniform = "uniform"
            case id = "id"
            case isMyself = "isMyself"
            case species = "species"
        }
    }

    // MARK: - PurpleNameplate
    public struct Nameplate: Codable {
        public let badges: [Badge?]
        public let background: Background
    }

    // MARK: - Background
    public struct Background: Codable {
        public let textColor: TextColor
        public let image: Image
        @IntegerRawValue public var id: Int
    }

    // MARK: - TextColor
    public struct TextColor: Codable {
        public let a: Int
        public let b: Int
        public let g: Int
        public let r: Int
    }

    // MARK: - Badge
    public struct Badge: Codable {
        @IntegerRawValue public var id: Int
        public let image: Image
    }

    // MARK: - HistoryDetailId
    public struct HistoryDetailId: Codable {
        public let id: String
    }

    // MARK: - WaveResult
    public struct WaveResult: Codable {
        public let waveNumber: Int
        public let waterLevel: Int
        public let eventWave: Ref?
        public let deliverNorm: Int?
        public let goldenPopCount: Int
        public let teamDeliverCount: Int?
        public let specialWeapons: [Ref]
    }
}
