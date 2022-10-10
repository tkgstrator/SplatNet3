//
//  ScheduleCoop.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Common
import Foundation

/// シフトスケジュール
public class StageSchedule: GraphQL {
    public typealias ResponseType = StageSchedule.Response
    public var hash: SHA256Hash = .StageScheduleQuery
    public var variables: [String: String] = [:]
    public var parameters: Parameters?

    init() {}

    // MARK: - Schedule
    public struct Response: Codable {
        public let data: DataClass
    }

    // MARK: - DataClass
    public struct DataClass: Codable {
//        public let regularSchedules: Schedules
//        public let bankaraSchedules: Schedules
//        public let xSchedules: Schedules
//        public let leagueSchedules: Schedules
        public let coopGroupingSchedule: CoopGroupingSchedule
//        public let festSchedules: Schedules
//        public let currentFest: JSONNull?
//        public let currentPlayer: CurrentPlayer
//        public let vsStages: VsStages
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

        enum CodingKeys: String, CodingKey {
            case isVsSetting = "__isVsSetting"
            case typename = "__typename"
            case vsStages = "vsStages"
            case vsRule = "vsRule"
            case mode = "mode"
        }

        public init(isVsSetting: IsVsSetting, typename: IsVsSetting, vsStages: [VsStage], vsRule: VsRule, mode: Mode?) {
            self.isVsSetting = isVsSetting
            self.typename = typename
            self.vsStages = vsStages
            self.vsRule = vsRule
            self.mode = mode
        }
    }

    public enum IsVsSetting: String, Codable, CaseIterable {
        case bankaraMatchSetting    = "BankaraMatchSetting"
        case leagueMatchSetting     = "LeagueMatchSetting"
        case regularMatchSetting    = "RegularMatchSetting"
        case xMatchSetting          = "XMatchSetting"
    }

    public enum Mode: String, Codable, CaseIterable {
        case challenge  = "CHALLENGE"
        case modeOPEN   = "OPEN"
    }

    // MARK: - VsRule
    public struct VsRule: Codable {
        public let name: String
        public let rule: Rule
        public let id: String
    }

    public enum Rule: String, Codable {
        case SplatZones     = "AREA"
        case ClamBlitz      = "CLAM"
        case Rainmaker      = "GOAL"
        case TowerControl   = "LOFT"
        case TurfWar        = "TURF_WAR"
    }

    // MARK: - VsStage
    public struct VsStage: Codable {
        public let id: String
        public let vsStageId: Int
        public let name: String
        public let image: Icon
    }

    // MARK: - Icon
    public struct Icon: Codable {
        @URLRawValue public var url: String
    }

    // MARK: - CoopGroupingSchedule
    public struct CoopGroupingSchedule: Codable {
        public let regularSchedules: SchedulesNode
        public let bigRunSchedules: SchedulesNode
    }

    // MARK: - RegularSchedules
    public struct SchedulesNode: Codable {
        public let nodes: [Node]
    }

    // MARK: - Node
    public struct Node: Codable {
        public let startTime: String
        public let endTime: String
        public let setting: Setting
    }

    // MARK: - Setting
    public struct Setting: Codable {
        public let coopStage: CoopStage
        public let weapons: [Weapon]
    }

    // MARK: - CoopStage
    public struct CoopStage: Codable {
        public let name: String
        public let coopStageId: Int
        public let thumbnailImage: Icon
        public let image: Icon
        public let id: StageType?

        enum CodingKeys: String, CodingKey {
            case name = "name"
            case coopStageId = "coopStageId"
            case thumbnailImage = "thumbnailImage"
            case image = "image"
            case id = "id"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decode(String.self, forKey: .name)
            self.coopStageId = try container.decode(Int.self, forKey: .coopStageId)
            self.thumbnailImage = try container.decode(Icon.self, forKey: .thumbnailImage)
            self.image = try container.decode(Icon.self, forKey: .image)
            self.id = StageType(id: coopStageId)
        }

    }

    // MARK: - Weapon
    public struct Weapon: Codable {
        public let name: String
        public let image: Icon
        public let id: WeaponType?

        enum CodingKeys: String, CodingKey {
            case name = "name"
            case image = "image"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decode(String.self, forKey: .name)
            self.image = try container.decode(Icon.self, forKey: .image)
            self.id = WeaponType(hash: image.url)
        }
    }

    // MARK: - CurrentPlayer
    public struct CurrentPlayer: Codable {
        public let userIcon: Icon
    }

    // MARK: - VsStages
    public struct VsStages: Codable {
        public let nodes: [VsStagesNode]
    }

    // MARK: - VsStagesNode
    public struct VsStagesNode: Codable {
        public let stageId: Int
        public let id: String
        public let originalImage: Icon
        public let name: String
//        public let stats: Stats?
    }
}

public extension StageSchedule.Node {
    func asSplatNet2() -> CoopSchedule.Response {
        CoopSchedule.Response(schedule: self)
    }
}
