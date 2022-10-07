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
        public let friends: Friends
//        public let currentFest: JSONNull?
    }

    // MARK: - Friends
    public struct Friends: Codable {
        public let nodes: [Node]
    }

    public enum OnlineStatus: String, CaseIterable, Codable {
        case COOP_MODE_ONLINE
        case ONLINE
        case OFFLINE
        case UNKNOWN
    }

    // MARK: - Node
    public struct Node: Codable {
        public let id: String
        public let onlineState: OnlineStatus
        public let nickname: String
        public let playerName: String?
        public let userIcon: UserIcon
//        public let vsMode: JSONNull?
        public let isFavorite: Bool
        public let isLocked: Bool?
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

            self.id = try container.decode(String.self, forKey: .id).base64DecodedString.capture(pattern: #"Friend-([a-f0-9]{16})"#, group: 1)!
            self.onlineState = {
                do {
                    return try container.decode(OnlineStatus.self, forKey: .onlineState)
                } catch {
                    return OnlineStatus.UNKNOWN
                }
            }()
            self.nickname = try container.decode(String.self, forKey: .nickname)
            self.playerName = try container.decode(String.self, forKey: .playerName)
            self.userIcon = try container.decode(UserIcon.self, forKey: .userIcon)
            self.isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
            self.isLocked = try container.decode(Bool.self, forKey: .isLocked)
            self.isVcEnabled = try container.decode(Bool.self, forKey: .isVcEnabled)
        }
    }

    // MARK: - UserIcon
    public struct UserIcon: Codable {
        public let url: String
        public let width: Int
        public let height: Int
    }
}
