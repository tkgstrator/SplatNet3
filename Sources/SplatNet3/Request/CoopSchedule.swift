//
//  CoopSchedule.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Common
import Alamofire

public class CoopSchedule: RequestType {
    public typealias ResponseType = [CoopSchedule.Response]
    public var baseURL: URL = URL(unsafeString: "https://asia-northeast1-tkgstratorwork.cloudfunctions.net/")
    public var path: String = "api/schedules/all"
    public var parameters: Parameters?
    public var headers: [String: String]?
    public var method: HTTPMethod = .get

    init() {}

    public struct Response: Codable {
        public let startTime: Date
        public let endTime: Date
        public let weaponList: [WeaponType]
        public let stageId: StageType
        public let mode: Common.Mode
        public let rule: Common.Rule

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let dateFormatter: ISO8601DateFormatter = {
                let formatter: ISO8601DateFormatter = ISO8601DateFormatter()
                formatter.timeZone = TimeZone.current
                return formatter
            }()

            self.startTime = dateFormatter.date(from: try container.decode(String.self, forKey: .startTime)) ?? Date(timeIntervalSince1970: 0)
            self.endTime = dateFormatter.date(from: try container.decode(String.self, forKey: .endTime)) ?? Date(timeIntervalSince1970: 0)
            self.weaponList = (try container.decode([Int].self, forKey: .weaponList)).compactMap({ WeaponType(id: $0) })
            self.stageId = StageType(id: try container.decode(Int.self, forKey: .stageId)) ?? .Unknown
            self.mode = Common.Mode.REGULAR
            self.rule = Common.Rule.REGULAR
        }

        init(schedule: StageSchedule.Node) {
            let dateFormatter: ISO8601DateFormatter = {
                let formatter: ISO8601DateFormatter = ISO8601DateFormatter()
                formatter.timeZone = TimeZone.current
                return formatter
            }()
            self.startTime = dateFormatter.date(from: schedule.startTime) ?? Date(timeIntervalSince1970: 0)
            self.endTime = dateFormatter.date(from: schedule.endTime) ?? Date(timeIntervalSince1970: 0)
            self.weaponList = schedule.setting.weapons.compactMap({ $0.id })
            self.stageId = schedule.setting.coopStage.id ?? .Unknown
            /// ここは多分固定
            self.mode = Common.Mode.REGULAR
            /// ルール
            self.rule = Common.Rule.REGULAR
        }
    }
}
