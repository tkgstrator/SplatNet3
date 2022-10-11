//
//  FriendList.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Common
import Alamofire

public class FriendList: GraphQL {
    public typealias ResponseType = FriendList.Response

    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var hash: SHA256Hash = .FriendListQuery
    public var variables: [String: String] = [:]

    public init() {}

    // MARK: - Response
    public struct Response: Codable {
        public let data: DataClass
    }

    // MARK: - DataClass
    public struct DataClass: Codable {
        /// フレンド
        public let friends: Friends
//        public let currentFest: JSONNull?
    }

    // MARK: - Friends
    public struct Friends: Codable {
        public let nodes: [Node]
    }

    public enum OnlineStatus: String, CaseIterable, Codable {
        /// サーモンラン中
        case COOP_MODE_ONLINE
        /// ナワバリバトル/バンカラマッチ
        case VS_MODE_FIGHTING
        /// オンライン
        case ONLINE
        /// オフライン
        case OFFLINE
    }

    // MARK: - Node
    public struct Node: Codable {
        /// ID
        public let id: String
        /// ステータス
        public let onlineState: OnlineStatus
        /// ニックネーム
        public let nickname: String?
        /// プレイヤー名
        public let playerName: String?
        /// アイコン
        public let userIcon: UserIcon
//        public let vsMode: VSMode?
        /// お気に入り
        public let isFavorite: Bool
        /// ロック
        public let isLocked: Bool?
        /// ボイスチャット
        public let isVcEnabled: Bool?

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case onlineState = "onlineState"
            case nickname = "nickname"
            case playerName = "playerName"
            case userIcon = "userIcon"
//            case vsMode = "vsMode"
            case isFavorite = "isFavorite"
            case isLocked = "isLocked"
            case isVcEnabled = "isVcEnabled"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            let id: String = try container.decode(String.self, forKey: .id)

            guard let decodedId: String = id.base64DecodedString,
                  let rawValue: String = decodedId.capture(pattern: #"Friend-([a-f0-9]{16})"#, group: 1) else {
                throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Invalid user id"))
            }
            self.id = rawValue
            self.onlineState = try container.decode(OnlineStatus.self, forKey: .onlineState)
            self.nickname = try container.decode(String.self, forKey: .nickname)
            self.playerName = try container.decodeIfPresent(String.self, forKey: .playerName)
            self.userIcon = try container.decode(UserIcon.self, forKey: .userIcon)
            self.isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
            self.isLocked = try container.decodeIfPresent(Bool.self, forKey: .isLocked)
            self.isVcEnabled = try container.decodeIfPresent(Bool.self, forKey: .isVcEnabled)
        }
    }

    public enum Mode: String, CaseIterable, Codable {
        case BANKARA
    }

    public struct VSMode: Codable {
        /// 名前
        public let name: String
        /// モード
        public let mode: Mode
        /// ステージの内部ID
        @IntegerIdRawValue public var id: Int
    }

    // MARK: - UserIcon
    public struct UserIcon: Codable {
        /// アイコン
        public let url: String
        /// 幅
        public let width: Int
        /// 高さ
        public let height: Int
    }
}
