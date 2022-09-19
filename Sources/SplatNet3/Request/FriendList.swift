//
//  File.swift
//  
//
//  Created by devonly on 2022/09/19.
//

import Foundation
import Common
import Alamofire

public class FriendList: GraphQL {
    public typealias ResponseType = FriendList.Response

    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var hash: SHA256Hash = .FRIEND_LIST
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

    // MARK: - Node
    public struct Node: Codable {
        public let id, onlineState, nickname: String
        public let playerName: String?
        public let userIcon: UserIcon
//        public let vsMode: JSONNull?
        public let isFavorite: Bool
        public let isLocked, isVcEnabled: Bool?
    }

    // MARK: - UserIcon
    public struct UserIcon: Codable {
        public let url: String
        public let width, height: Int
    }
}
