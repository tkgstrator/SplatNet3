//
//  FriendListQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import Common

public final class FriendListQuery: GraphQL {
	public typealias ResponseType = FriendListQuery.Response
	public var hash: SHA256Hash = .FriendListQuery
	public var variables: [String: String] = [:]
	public var parameters: Parameters?

	init() {}

    // MARK: - Response
    public struct Response: Codable {
        public let data: DataClass
    }

    // MARK: - DataClass
    public struct DataClass: Codable {
        public let friends: Common.Node<FriendList>
//        public let currentFest: JSONNull?
    }

    // MARK: - Node
    public struct FriendList: Codable {
        public let id: String
        public let onlineState: OnlineState
        public let nickname: String
        public let playerName: String?
        public let userIcon: UserIcon
        public let vsMode: VsMode?
        public let isFavorite: Bool
        public let isLocked: Bool?
        public let isVcEnabled: Bool?

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try {
                guard let context: String = try container.decode(String.self, forKey: .id).base64DecodedString,
                      let stringValue: String = context.capture(pattern: #"Friend-([a-f0-9]{16})"#, group: 1)
                else {
                    throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Given value does not contain nsaid."))
                }
                return stringValue
            }()

            self.onlineState = try container.decode(OnlineState.self, forKey: .onlineState)
            self.nickname = try container.decode(String.self, forKey: .nickname)
            self.playerName = try container.decodeIfPresent(String.self, forKey: .playerName)
            self.userIcon = try container.decode(UserIcon.self, forKey: .userIcon)
            self.vsMode = try container.decodeIfPresent(VsMode.self, forKey: .vsMode)
            self.isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
            self.isLocked = try container.decodeIfPresent(Bool.self, forKey: .isLocked)
            self.isVcEnabled = try container.decodeIfPresent(Bool.self, forKey: .isVcEnabled)
        }
    }

    public enum OnlineState: String, Codable {
        case UNKNOWN
        case COOP_MODE_FIGHTING
        case COOP_MODE_MATCHING
        case OFFLINE
        case ONLINE
        case VS_MODE_FIGHTING
        case VS_MODE_MATCHING

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let stringValue: String = try container.decode(String.self)
            self = Self(rawValue: stringValue) ?? .UNKNOWN
        }
    }

    // MARK: - UserIcon
    public struct UserIcon: Codable {
        public let url: URL
        public let width: Int
        public let height: Int
    }

    // MARK: - VsMode
    public struct VsMode: Codable {
        public let name: String
        public let mode: VsModeKey
        @IntegerRawValue public var id: VsModeId
    }
}
