//
//  Result.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Common
import Foundation

//  swiftlint:disable type_body_length
public class CoopResult: RequestType {
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
        public let jobScore: Int?
        public let playerType: PlayerType?
        public let grade: GradeType?
        //  swiftlint:disable:next discouraged_optional_collection
        public let otherResults: [PlayerResult]?
        public let schedule: Schedule
        public let kumaPoint: Int?
        public let waveDetails: [WaveDetail]
        public let jobResult: JobResult
        public let jobId: Int?
        public let myResult: PlayerResult
        public let gradePointDelta: Int?
        public let jobRate: Int?
        public let startTime, playTime, endTime: Int
        public let bossCounts: CodableDictionary<BossId, BossCount>
        public let gradePoint: Int?
        public let dangerRate: Double

        public init(
            jobScore: Int?,
            playerType: CoopResult.PlayerType?,
            grade: CoopResult.GradeType?,
            //  swiftlint:disable:next discouraged_optional_collection
            otherResults: [CoopResult.PlayerResult],
            schedule: CoopResult.Schedule,
            kumaPoint: Int?,
            waveDetails: [CoopResult.WaveDetail],
            jobResult: CoopResult.JobResult,
            jobId: Int?,
            myResult: CoopResult.PlayerResult,
            gradePointDelta: Int?,
            jobRate: Int?,
            startTime: Int,
            playTime: Int,
            endTime: Int,
            bossCounts: CodableDictionary<BossId, BossCount>,
            gradePoint: Int?,
            dangerRate: Double
        ) {
            self.jobScore = jobScore
            self.playerType = playerType
            self.grade = grade
            self.otherResults = otherResults
            self.schedule = schedule
            self.kumaPoint = kumaPoint
            self.waveDetails = waveDetails
            self.jobResult = jobResult
            self.jobId = jobId
            self.myResult = myResult
            self.gradePointDelta = gradePointDelta
            self.jobRate = jobRate
            self.startTime = startTime
            self.playTime = playTime
            self.endTime = endTime
            self.bossCounts = bossCounts
            self.gradePoint = gradePoint
            self.dangerRate = dangerRate
        }
    }

    // MARK: - BossCount
    public struct BossCount: Codable {
        public let boss: Boss
        public let count: Int

        public init(boss: CoopResult.Boss, count: Int) {
            self.boss = boss
            self.count = count
        }
    }

    // MARK: - Boss
    public struct Boss: Codable {
        public let name: String
        public let key: BossKey

        public init(name: String, key: BossKey) {
            self.name = name
            self.key = key
        }
    }

    // MARK: - EventType
    public struct EventType: Codable {
        public let name: String
        public let key: EventKey

        public init(name: String, key: EventKey) {
            self.name = name
            self.key = key
        }
    }

    // MARK: - WaterLevel
    public struct WaterLevel: Codable {
        public let name: String
        public let key: WaterKey

        public init(name: String, key: WaterKey) {
            self.name = name
            self.key = key
        }
    }

    // MARK: - Grade
    public struct GradeType: Codable {
        public let longName: String?
        public let id: GradeId
        public let shortName: String?
        public let name: String

        public init(longName: String?, id: GradeId, shortName: String?, name: String) {
            self.longName = longName
            self.id = id
            self.shortName = shortName
            self.name = name
        }
    }

    // MARK: - JobResult
    public struct JobResult: Codable {
        @NullCodable public var failureWave: Int?
        public let isClear: Bool
        @NullCodable public var failureReason: FailureReason?

        public init(failureWave: Int?, isClear: Bool, failureReason: FailureReason?) {
            self.failureWave = failureWave
            self.isClear = isClear
            self.failureReason = failureReason
        }
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

        public init(
            pid: String,
            specialCounts: [Int],
            goldenIkuraNum: Int,
            bossKillCounts: CodableDictionary<BossId, BossCount>,
            special: CoopResult.SpecialType,
            deadCount: Int,
            name: String?,
            ikuraNum: Int,
            playerType: CoopResult.PlayerType?,
            helpCount: Int,
            weaponList: [CoopResult.WeaponList]
        ) {
            self.pid = pid
            self.specialCounts = specialCounts
            self.goldenIkuraNum = goldenIkuraNum
            self.bossKillCounts = bossKillCounts
            self.special = special
            self.deadCount = deadCount
            self.name = name
            self.ikuraNum = ikuraNum
            self.playerType = playerType
            self.helpCount = helpCount
            self.weaponList = weaponList
        }
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

        public init(imageA: ImageA, imageB: ImageB, name: String, id: SpecialId) {
            self.imageA = imageA
            self.imageB = imageB
            self.name = name
            self.id = id
        }
    }

    // MARK: - WeaponList
    public struct WeaponList: Codable {
        public let id: WeaponType.WeaponId
        public let weapon: Brand?
        public let coopSpecialWeapon: Brand?

        public init(id: WeaponType.WeaponId, weapon: CoopResult.Brand?, coopSpecialWeapon: CoopResult.Brand?) {
            self.id = id
            self.weapon = weapon
            self.coopSpecialWeapon = coopSpecialWeapon
        }
    }

    // MARK: - Brand
    public struct Brand: Codable {
        public let id: WeaponType.WeaponId?
        public let thumbnail: String?
        public let image: WeaponType.Image
        public let name: String

        public init(id: WeaponType.WeaponId?, thumbnail: String?, image: WeaponType.Image, name: String) {
            self.id = id
            self.thumbnail = thumbnail
            self.image = image
            self.name = name
        }
    }

    // MARK: - Schedule
    public struct Schedule: Codable {
        public let stage: Stage
        public let weapons: [WeaponList]
        public let endTime, startTime: Int

        public init(stage: CoopResult.Stage, weapons: [CoopResult.WeaponList], endTime: Int, startTime: Int) {
            self.stage = stage
            self.weapons = weapons
            self.endTime = endTime
            self.startTime = startTime
        }
    }

    // MARK: - Stage
    public struct Stage: Codable {
        public let name: String
        public let image: StageKey

        public init(name: String, image: StageKey) {
            self.name = name
            self.image = image
        }
    }

    // MARK: - WaveDetail
    public struct WaveDetail: Codable {
        public let quotaNum, goldenIkuraPopNum: Int
        public let waterLevel: WaterLevel
        public let ikuraNum, goldenIkuraNum: Int
        public let eventType: EventType

        public init(
            quotaNum: Int,
            goldenIkuraPopNum: Int,
            waterLevel: CoopResult.WaterLevel,
            ikuraNum: Int,
            goldenIkuraNum: Int,
            eventType: CoopResult.EventType
        ) {
            self.quotaNum = quotaNum
            self.goldenIkuraPopNum = goldenIkuraPopNum
            self.waterLevel = waterLevel
            self.ikuraNum = ikuraNum
            self.goldenIkuraNum = goldenIkuraNum
            self.eventType = eventType
        }
    }
}
//  swiftlint:enable type_body_length

public extension CoopResult.Response {
    var playerResults: [CoopResult.PlayerResult] {
        [myResult] + (otherResults ?? [])
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
