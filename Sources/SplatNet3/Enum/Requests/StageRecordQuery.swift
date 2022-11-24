//
//  StageRecordQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import Common

final class StageRecordQuery: GraphQL {
	public typealias ResponseType = StageRecordQuery.Response
	var hash: SHA256Hash = .StageRecordQuery
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
        public let nameplate: Nameplate
        public let weapon: CurrentPlayerWeapon
        public let headGear: Gear
        public let clothingGear: Gear
        public let shoesGear: Gear
        public let userIcon: UserIcon
    }

    // MARK: - Gear
    public struct Gear: Codable {
        public let isGear: String
        public let name: String
        public let image: UserIcon
        public let primaryGearPower: GearPower
        public let additionalGearPowers: [GearPower]
    }

    // MARK: - GearPower
    public struct GearPower: Codable {
        public let name: String
        public let image: UserIcon
    }

    // MARK: - UserIcon
    public struct UserIcon: Codable {
        public let url: String
    }

    // MARK: - Nameplate
    public struct Nameplate: Codable {
        public let badges: [Badge]
        public let background: Background
    }

    // MARK: - Background
    public struct Background: Codable {
        public let textColor: TextColor
        public let image: UserIcon
        public let id: String
    }

    // MARK: - TextColor
    public struct TextColor: Codable {
        public let a: Double
        public let b: Double
        public let g: Double
        public let r: Double
    }

    // MARK: - CurrentPlayerWeapon
    public struct CurrentPlayerWeapon: Codable {
        public let name: String
        public let image: UserIcon
        public let subWeapon: SpecialWeaponElement
        public let specialWeapon: SpecialWeaponElement
        public let id: String
    }

    // MARK: - SpecialWeaponElement
    public struct SpecialWeaponElement: Codable {
        public let name: String
        public let image: UserIcon
        public let id: String
        public let weaponID: Int?
    }

    // MARK: - PlayHistory
    public struct PlayHistory: Codable {
        public let currentTime: String
        public let gameStartTime: String
        public let rank: Int
        public let udemae: String
        public let udemaeMax: String
        public let xMatchMaxAr: XMatchMax
        public let xMatchMaxCl: XMatchMax
        public let xMatchMaxGl: XMatchMax
        public let xMatchMaxLF: XMatchMax
        public let winCountTotal: Int
        public let frequentlyUsedWeapons: [SpecialWeaponElement]
        public let paintPointTotal: Int
        public let badges: [BadgeElement]
        public let weaponHistory: WeaponHistory
        public let recentBadges: [Badge]
        public let allBadges: [Badge]
    }

    // MARK: - Badge
    public struct Badge: Codable {
        public let id: String
        public let image: UserIcon
        public let badgeDescription: String
    }

    // MARK: - BadgeElement
    public struct BadgeElement: Codable {
        public let id: String
    }

    // MARK: - WeaponHistory
    public struct WeaponHistory: Codable {
        public let nodes: [Node]
    }

    // MARK: - Node
    public struct Node: Codable {
        public let seasonName: String
        public let isMonthly: Bool
        public let startTime: String
        public let endTime: String
        public let weaponCategories: [WeaponCategoryElement]
        public let weapons: [NodeWeapon]
    }

    // MARK: - WeaponCategoryElement
    public struct WeaponCategoryElement: Codable {
        public let weaponCategory: WeaponCategoryWeaponCategory
        public let utilRatio: Int
        public let weapons: [WeaponCategoryWeapon]
    }

    // MARK: - WeaponCategoryWeaponCategory
    public struct WeaponCategoryWeaponCategory: Codable {
        public let name: String
        public let category: String
        public let id: String
    }

    // MARK: - WeaponCategoryWeapon
    public struct WeaponCategoryWeapon: Codable {
        public let weapon: PurpleWeapon
        public let utilRatio: Double
    }

    // MARK: - PurpleWeapon
    public struct PurpleWeapon: Codable {
        public let name: String
        public let image: UserIcon
        public let weaponID: Int
        public let weaponCategory: WeaponWeaponCategory
        public let id: String
    }

    // MARK: - WeaponWeaponCategory
    public struct WeaponWeaponCategory: Codable {
        public let category: String
        public let id: String
    }

    // MARK: - NodeWeapon
    public struct NodeWeapon: Codable {
        public let weapon: SpecialWeaponElement
        public let utilRatio: Double
    }

    // MARK: - XMatchMax
    public struct XMatchMax: Codable {
//        public let power: JSONNull?
//        public let rank: JSONNull?
//        public let rankUpdateSeasonName: JSONNull?
//        public let powerUpdateTime: JSONNull?
    }
}
