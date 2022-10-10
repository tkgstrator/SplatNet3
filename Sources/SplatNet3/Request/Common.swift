//
//  Common.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public enum Common {
    // MARK: - Image
    public struct Image: Codable {
        /// 画像URLのハッシュ
        @URLRawValue public var url: String
    }

    // MARK: - PurpleNameplate
    public struct Nameplate: Codable {
        /// つけているバッジ
        public let badges: [Badge?]
        /// ネームプレートの背景画像
        public let background: Background
    }

    // MARK: - Background
    public struct Background: Codable {
        /// 文字色
        public let textColor: TextColor
        /// 画像
        public let image: Image
        /// 内部ID
        @IntegerRawValue public var id: Int
    }

    // MARK: - TextColor
    public struct TextColor: Codable {
        /// 不透明度
        public let a: Double
        /// 青
        public let b: Double
        /// 緑
        public let g: Double
        /// 赤
        public let r: Double
    }

    // MARK: - Badge
    public struct Badge: Codable {
        /// 内部ID
        @IntegerRawValue public var id: Int
        /// 画像
        public let image: Image
        /// 解説
        public let description: String?
    }

    // MARK: - BadgeElement
    public struct IdRef: Codable {
        /// 内部ID
        @IntegerRawValue public var id: Int
    }

    // MARK: - Weapon
    public struct Weapon: Codable {
        /// 名前
        public let name: String
        /// 画像
        public let image: Image
        ///
        public let id: String
        public let weaponId: Int?
        public let weaponCategory: WeaponCategory
    }

    // MARK: - WeaponCategory
    public struct WeaponCategory: Codable {
        let category: String
        @IntegerRawValue var id: Int
    }

    // MARK: - Gear
    public struct Gear: Codable {
        public let isGear: String
        public let name: String
        public let image: Image
        public let primaryGearPower: GearPower
        public let additionalGearPowers: [GearPower]

        enum CodingKeys: String, CodingKey {
            case isGear = "__isGear"
            case name = "name"
            case image = "image"
            case primaryGearPower = "primaryGearPower"
            case additionalGearPowers = "additionalGearPowers"
        }
    }

    // MARK: - GearPower
    public struct GearPower: Codable {
        public let name: String
        public let image: Image
    }

    // MARK: - Scale
    public struct Scale: Codable {
        /// 金ウロコ数
        public let gold: Int
        /// 銀ウロコ数
        public let silver: Int
        /// 銅ウロコ数
        public let bronze: Int
    }

    // MARK: - Grade
    public struct Grade: Codable {
        /// 称号名
        public let name: String
        /// 内部ID
        @IntegerRawValue public var id: Int
    }

    // MARK: - Boss
    public struct Boss: Codable {
        /// 名前
        public let name: String
        /// 内部ID
        @IntegerRawValue var id: Int
    }

    // MARK: - CoopStage
    public struct CoopStage: Codable {
        /// 名前
        public let name: String
        /// 内部ID
        @IntegerRawValue public var id: Int
    }

    // MARK: - BossResult
    public struct BossResult: Codable {
        /// オカシラシャケをたおしたか
        public let hasDefeatBoss: Bool
        /// オカシラシャケ
        public let boss: Boss
    }

    /// サーモンランのモード
    public enum Mode: String, CaseIterable, Codable {
        /// いつものバイト
        case REGULAR
        /// プライベートバイト
        case PRIVATE_CUSTOM
    }

    /// サーモンランのルール
    public enum Rule: String, CaseIterable, Codable {
        /// 通常のサーモンラン
        case REGULAR
        /// ビッグラン
        case BIGRUN
        /// コンテスト
        case CONTEST
        /// ペア
        case PAIR
    }
}
