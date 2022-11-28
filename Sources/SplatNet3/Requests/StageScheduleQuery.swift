//
//  StageScheduleQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import SplatNet

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
//        public let bigRunSchedules: Schedules
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
        public let name: String
        public let coopStageId: CoopStageId
        public let thumbnailImage: Common.URL<CoopStageThumbnailKey>
        public let image: Common.URL<CoopStageThumbnailKey>
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
    }

    // MARK: - Stats
    public struct Stats: Codable {
//        public let winRateAr: JSONNull?
//        public let winRateLF: JSONNull?
//        public let winRateGl: JSONNull?
//        public let winRateCl: JSONNull?
    }
}
