//
//  StageScheduleQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import Common

final class StageScheduleQuery: GraphQL {
	public typealias ResponseType = StageScheduleQuery.Response
	var hash: SHA256Hash = .StageScheduleQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

    // MARK: - Response
    public struct Response: Codable {
        public let data: DataClass
    }

    // MARK: - DataClass
    public struct DataClass: Codable {
        public let regularSchedules: Schedules
        public let bankaraSchedules: Schedules
        public let xSchedules: Schedules
        public let leagueSchedules: Schedules
        public let coopGroupingSchedule: CoopGroupingSchedule
        public let festSchedules: Schedules
//        public let currentFest: JSONNull?
        public let currentPlayer: CurrentPlayer
        public let vsStages: VsStages
    }

    // MARK: - Schedules
    public struct Schedules: Codable {
        public let nodes: [BankaraSchedulesNode]
    }

    // MARK: - BankaraSchedulesNode
    public struct BankaraSchedulesNode: Codable {
        public let startTime: String
        public let endTime: String
        public let bankaraMatchSettings: [MatchSetting]?
//        public let festMatchSetting: JSONNull?
        public let leagueMatchSetting: MatchSetting?
        public let regularMatchSetting: MatchSetting?
        public let xMatchSetting: MatchSetting?
    }

    // MARK: - MatchSetting
    public struct MatchSetting: Codable {
        public let isVsSetting: IsVsSetting
        public let typename: IsVsSetting
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
        public let name: Name
        public let rule: Rule
        public let id: ID
    }

    public enum ID: String, Codable {
        case vnNSDWxlLTA = "VnNSdWxlLTA="
        case vnNSDWxlLTE = "VnNSdWxlLTE="
        case vnNSDWxlLTI = "VnNSdWxlLTI="
        case vnNSDWxlLTM = "VnNSdWxlLTM="
        case vnNSDWxlLTQ = "VnNSdWxlLTQ="
    }

    public enum Name: String, Codable {
        case ガチアサリ = "ガチアサリ"
        case ガチエリア = "ガチエリア"
        case ガチホコバトル = "ガチホコバトル"
        case ガチヤグラ = "ガチヤグラ"
        case ナワバリバトル = "ナワバリバトル"
    }

    public enum Rule: String, Codable {
        case area = "AREA"
        case clam = "CLAM"
        case goal = "GOAL"
        case loft = "LOFT"
        case turfWar = "TURF_WAR"
    }

    // MARK: - VsStage
    public struct VsStage: Codable {
        public let id: String
        public let vsStageID: Int
        public let name: String
        public let image: UserIcon
    }

    // MARK: - UserIcon
    public struct UserIcon: Codable {
        public let url: String
    }

    // MARK: - CoopGroupingSchedule
    public struct CoopGroupingSchedule: Codable {
        public let regularSchedules: RegularSchedules
        public let bigRunSchedules: Schedules
    }

    // MARK: - RegularSchedules
    public struct RegularSchedules: Codable {
        public let nodes: [PurpleNode]
    }

    // MARK: - PurpleNode
    public struct PurpleNode: Codable {
        public let startTime: String
        public let endTime: String
        public let setting: Setting
    }

    // MARK: - Setting
    public struct Setting: Codable {
        public let typename: String
        public let coopStage: CoopStage
        public let weapons: [Weapon]
    }

    // MARK: - CoopStage
    public struct CoopStage: Codable {
        public let name: String
        public let coopStageID: Int
        public let thumbnailImage: UserIcon
        public let image: UserIcon
        public let id: String
    }

    // MARK: - Weapon
    public struct Weapon: Codable {
        public let name: String
        public let image: UserIcon
    }

    // MARK: - CurrentPlayer
    public struct CurrentPlayer: Codable {
        public let userIcon: UserIcon
    }

    // MARK: - VsStages
    public struct VsStages: Codable {
        public let nodes: [VsStagesNode]
    }

    // MARK: - VsStagesNode
    public struct VsStagesNode: Codable {
        public let stageID: Int
        public let id: String
        public let vsStageID: Int
        public let originalImage: UserIcon
        public let name: String
        public let stats: Stats?
    }

    // MARK: - Stats
    public struct Stats: Codable {
//        public let winRateAr: JSONNull?
//        public let winRateLF: JSONNull?
//        public let winRateGl: JSONNull?
//        public let winRateCl: JSONNull?
    }
}
