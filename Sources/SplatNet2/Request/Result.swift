//
//  CoopResult.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Common
import Foundation

public struct CoopResult: RequestType {
    public typealias ResponseType = CoopResult.Response

    public var method: HTTPMethod = .get
    public var path: String
    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var headers: [String: String]?

    public init(resultId: Int) {
        self.path = "coop_results/\(resultId)"
    }

    // MARK: - Result
    public struct Response: Codable {
        public let jobScore: Int
        public let playerType: PlayerType
        public let grade: GradeType
        public let otherResults: [PlayerResult]
        public let schedule: Schedule
        public let kumaPoint: Int
        public let waveDetails: [WaveDetail]
        public let jobResult: JobResult
        public let jobId: Int
        public let myResult: PlayerResult
        public let gradePointDelta: Int
        public let jobRate: Int
        public let startTime, playTime, endTime: Int
        public let bossCounts: CodableDictionary<BossId, BossCount>
        public let gradePoint: Int
        public let dangerRate: Double
    }

    // MARK: - BossCount
    public struct BossCount: Codable {
        public let boss: Boss
        public let count: Int
    }

    // MARK: - Boss
    public struct Boss: Codable {
        public let name: String
        public let key: BossKey
    }

    // MARK: - EventType
    public struct EventType: Codable {
        public let name: String
        public let key: EventKey
    }

    // MARK: - WaterLevel
    public struct WaterLevel: Codable {
        public let name: String
        public let key: WaterKey
    }

    // MARK: - Grade
    public struct GradeType: Codable {
        public let longName: String?
        public let id: GradeId
        public let shortName: String?
        public let name: String
    }

    // MARK: - JobResult
    public struct JobResult: Codable {
        @NullCodable public var failureWave: Int?
        public let isClear: Bool
        @NullCodable public var failureReason: FailureReason?
    }

    // MARK: - PlayerResult
    public struct PlayerResult: Codable {
        public let pid: String
        public let specialCounts: [Int]
        public let goldenIkuraNum: Int
        public let bossKillCounts: CodableDictionary<BossId, BossCount>
        public let special: SpecialType
        public let deadCount: Int
        public let name: String?
        public let ikuraNum: Int
        public let playerType: PlayerType?
        public let helpCount: Int
        public let weaponList: [WeaponList]
    }

    // MARK: - PlayerType
    public struct PlayerType: Codable {
        public let style: Style
        public let species: Species
    }

    // MARK: - Special
    public struct SpecialType: Codable {
        public let imageA: ImageA
        public let imageB: ImageB
        public let name: String
        public let id: SpecialId
    }

    // MARK: - WeaponList
    public struct WeaponList: Codable {
        public let id: WeaponType.WeaponId
        public let weapon: Brand?
        public let coopSpecialWeapon: Brand?
    }

    // MARK: - Brand
    public struct Brand: Codable {
        public let id: WeaponType.WeaponId?
        public let thumbnail: String?
        public let image: WeaponType.WeaponKey
        public let name: String
    }

    // MARK: - Schedule
    public struct Schedule: Codable {
        public let stage: Stage
        public let weapons: [WeaponList]
        public let endTime, startTime: Int
    }

    // MARK: - Stage
    public struct Stage: Codable {
        public let name: String
        public let image: StageKey
    }

    // MARK: - WaveDetail
    public struct WaveDetail: Codable {
        public let quotaNum, goldenIkuraPopNum: Int
        public let waterLevel: WaterLevel
        public let ikuraNum, goldenIkuraNum: Int
        public let eventType: EventType
    }
}

public extension CoopResult.Response {
    var playerResults: [CoopResult.PlayerResult] {
        [myResult] + otherResults
    }
}

public extension CoopResult.EventType {
    var rawValue: EventId {
        switch self.key {
        case .waterLevels:
            return .waterLevels
        case .rush:
            return .rush
        case .goldieSeeking:
            return .goldieSeeking
        case .griller:
            return .griller
        case .fog:
            return .fog
        case .theMothership:
            return .theMothership
        case .cohockCharge:
            return .cohockCharge
        }
    }
}

public extension CoopResult.WaterLevel {
    var rawValue: WaterId {
        switch self.key {
        case .low:
            return .low
        case .normal:
            return .normal
        case .high:
            return .high
        }
    }
}

extension CoopResult.WaveDetail: Equatable {
    public static func == (lhs: CoopResult.WaveDetail, rhs: CoopResult.WaveDetail) -> Bool {
        lhs.ikuraNum == rhs.ikuraNum &&
        lhs.goldenIkuraNum == rhs.goldenIkuraNum &&
        lhs.goldenIkuraPopNum == rhs.goldenIkuraPopNum &&
        lhs.quotaNum == rhs.quotaNum &&
        lhs.eventType.key == rhs.eventType.key &&
        lhs.waterLevel.key == rhs.waterLevel.key
    }
}

extension CoopResult.Response: Equatable {
    public static func == (lhs: CoopResult.Response, rhs: CoopResult.Response) -> Bool {
        lhs.playTime == rhs.startTime
    }
}

extension CodableDictionary where Key == BossId, Value == CoopResult.BossCount {
    public func sortedValue() -> [Int] {
        self.sorted(by: { $0.key.rawValue < $1.key.rawValue }).map({ $0.value.count })
    }
}
