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

final class FriendListQuery: GraphQL {
	public typealias ResponseType = FriendListQuery.Response
	var hash: SHA256Hash = .FriendListQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

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

    // MARK: - Node
    public struct Node: Codable {
        public let id: String
        public let onlineState: OnlineState
        public let nickname: String
        public let playerName: String?
        public let userIcon: UserIcon
        public let vsMode: VsMode?
        public let isFavorite: Bool
        public let isLocked: Bool?
        public let isVcEnabled: Bool?
    }

    public enum OnlineState: String, Codable {
        case coopModeFighting = "COOP_MODE_FIGHTING"
        case offline = "OFFLINE"
        case online = "ONLINE"
        case vsModeFighting = "VS_MODE_FIGHTING"
    }

    // MARK: - UserIcon
    public struct UserIcon: Codable {
        public let url: String
        public let width: Int
        public let height: Int
    }

    // MARK: - VsMode
    public struct VsMode: Codable {
        public let name: String
        public let mode: String
        public let id: String
    }
}
