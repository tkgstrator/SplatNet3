//
//  HistoryRecord.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire
import Common

final class HistoryRecord: GraphQL {
    public typealias ResponseType = HistoryRecord.Response
    var hash: SHA256Hash = .HistoryRecordQuery
    var variables: [String: String] = [:]
    var parameters: Parameters?

    init() {}

    // MARK: - Response
    public struct Response: Codable {
        public let data: DataClass
    }

    // MARK: - DataClass
    public struct DataClass: Codable {
        public let currentPlayer: CurrentPlayer
        public let playHistory: PlayHistory
    }

    // MARK: - CurrentPlayer
    public struct CurrentPlayer: Codable {
        public let isPlayer: String
        public let byname: String
        public let name: String
        public let nameID: String
        public let nameplate: Common.Nameplate
//        public let weapon: Common.CurrentPlayerWeapon
        public let headGear: Common.Gear
        public let clothingGear: Common.Gear
        public let shoesGear: Common.Gear

        enum CodingKeys: String, CodingKey {
            case isPlayer = "__isPlayer"
            case byname = "byname"
            case name = "name"
            case nameID = "nameId"
            case nameplate = "nameplate"
//            case weapon = "weapon"
            case headGear = "headGear"
            case clothingGear = "clothingGear"
            case shoesGear = "shoesGear"
        }
    }

    // MARK: - PlayHistory
    public struct PlayHistory: Codable {
        public let currentTime: String
        public let gameStartTime: String
        public let udemaeMax: String
//        public let xMatchMaxAr: XMatchMax
//        public let xMatchMaxCl: XMatchMax
//        public let xMatchMaxGl: XMatchMax
//        public let xMatchMaxLF: XMatchMax
        public let winCountTotal: Int
//        public let frequentlyUsedWeapons: [Weapon]
        public let paintPointTotal: Int
        public let badges: [Common.IdRef]
//        public let weaponHistory: WeaponHistory
        public let recentBadges: [Common.Badge]
        public let allBadges: [Common.Badge]
    }
}
