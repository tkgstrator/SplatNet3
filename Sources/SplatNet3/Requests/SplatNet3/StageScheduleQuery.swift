//
//  StageScheduleQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire


public final class StageScheduleQuery: GraphQL {
	public typealias ResponseType = StageScheduleQuery.Response
    public typealias Schedules = Common.Node<BankaraSchedule>

	public var hash: SHA256Hash = .StageScheduleQuery
	public var variables: [String: String] = [:]
	public var parameters: Parameters?

	init() {}

    // MARK: - Response
    public struct Response: Codable {
        public let data: DataClass
    }

    // MARK: - DataClass
    public struct DataClass: Codable {
        public let xSchedules: Schedules
        public let festSchedules: Schedules
        public let leagueSchedules: Schedules
        public let regularSchedules: Schedules
        public let bankaraSchedules: Schedules
        public let coopGroupingSchedule: CoopGroupingSchedule
//        public let currentFest: JSONNull?
        public let currentPlayer: CurrentPlayer
//        public let vsStages: VsStages
    }

    // MARK: - CurrentPlayer
    public struct CurrentPlayer: Codable {
        public let userIcon: UserIcon
    }

    // MARK: - CoopGroupingSchedule
    public struct CoopGroupingSchedule: Codable {
        public let regularSchedules: Common.Node<CoopSchedule>
        public let bigRunSchedules: Common.Node<CoopSchedule>
    }

    // MARK: - BankaraSchedulesNode
    public struct BankaraSchedule: Codable {
        public let startTime: Date
        public let endTime: Date
        public let bankaraMatchSettings: [MatchSetting]?
//        public let festMatchSetting: JSONNull?
        public let leagueMatchSetting: MatchSetting?
        public let regularMatchSetting: MatchSetting?
        public let xMatchSetting: MatchSetting?
    }

    // MARK: - MatchSetting
    public struct MatchSetting: Codable {
        public let vsStages: [VsStage]
        public let vsRule: VsRule
        public let mode: Mode?
    }

    public enum IsVsSetting: String, Codable {
        case bankara    = "BankaraMatchSetting"
        case league     = "LeagueMatchSetting"
        case regular    = "RegularMatchSetting"
        case xMatch     = "XMatchSetting"
    }

    public enum Mode: String, Codable {
        case challenge  = "CHALLENGE"
        case open       = "OPEN"
    }

    // MARK: - VsRule
    public struct VsRule: Codable {
        public let name: String
        public let rule: VsRuleKey
        @IntegerRawValue public var id: VsRuleType
    }

    // MARK: - VsStageDetail
    public struct VsStageDetail: Codable {
        public var id: VsStageId
        public let stageId: Int
        public var vsStageId: VsStageId
//        public let originalImage: UserIcon
        public let name: String
        public let stats: Stats?
    }

    // MARK: - VsStage
    public struct VsStage: Codable {
        @IntegerRawValue public var id: VsStageId
        public var vsStageId: VsStageId
        public let name: String
        public let image: Common.URL<VsStageKey>
    }

    // MARK: - CoopStage
    public struct CoopStage: Codable {
        @IntegerRawValue public var id: CoopStageId
        public let image: Common.URL<CoopStageKey>
        public let name: String
        public let thumbnailImage: Common.URL<CoopStageKey>
    }

    // MARK: - UserIcon
    public struct UserIcon: Codable {
        public let url: URL
    }

    // MARK: - CoopSchedule
    public struct CoopSchedule: Codable {
        public let startTime: Date
        public let endTime: Date
        public let setting: Setting
    }

    // MARK: - Setting
    public struct Setting: Codable {
        public let coopStage: CoopStage
        public let weapons: [WeaponType]
        public let isCoopSetting: CoopSetting

        enum CodingKeys: String, CodingKey {
            case coopStage
            case weapons
            case isCoopSetting  = "__isCoopSetting"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.coopStage = try container.decode(StageScheduleQuery.CoopStage.self, forKey: StageScheduleQuery.Setting.CodingKeys.coopStage)
            self.weapons = try container.decode([WeaponType].self, forKey: StageScheduleQuery.Setting.CodingKeys.weapons)
            self.isCoopSetting = {
                if let setting: CoopSetting = try? container.decode(CoopSetting.self, forKey: .isCoopSetting) {
                    return setting
                }
                return .CoopNormalSetting
            }()
        }
    }

    // MARK: - Stats
    public struct Stats: Codable {
        public let winRateAr: Decimal?
        public let winRateLF: Decimal?
        public let winRateGl: Decimal?
        public let winRateCl: Decimal?
    }
}
