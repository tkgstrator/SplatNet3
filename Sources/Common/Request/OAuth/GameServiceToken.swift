//
//  GameServiceToken.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

/// SplatoonToken
public class GameServiceToken: RequestType {
    public typealias ResponseType = GameServiceToken.Response

    public var method: HTTPMethod = .post
    public var baseURL = URL(unsafeString: "https://api-lp1.znc.srv.nintendo.net/")
    public var path: String = "v3/Account/Login"
    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var headers: [String: String]?

    public init(imink: Imink.Response, accessToken: String, version: String) {
        self.headers = [
            "X-ProductVersion": "\(version)",
            "X-Platform": "Android",
        ]
        self.parameters = [
            "parameter": [
                "f": imink.f,
                "naIdToken": accessToken,
                "timestamp": imink.timestamp,
                "requestId": imink.requestId,
                "naCountry": "JP",
                "naBirthday": "1990-01-01",
                "language": "ja-JP",
            ],
        ]
    }

    public convenience init(imink: Imink.Response, accessToken: AccessToken.Response, version: Version.Response) {
        self.init(imink: imink, accessToken: accessToken.accessToken, version: version.version)
    }

    public convenience init(imink: Imink.Response, accessToken: AccessToken.Response, version: String) {
        self.init(imink: imink, accessToken: accessToken.accessToken, version: version)
    }

    // MARK: - Response
    public struct Response: Codable {
        public let status: Int
        public let result: Result
        public let correlationId: String
    }

    // MARK: - Result
    public struct Result: Codable {
        public let user: User
        public let webApiServerCredential: Credential
        public let firebaseCredential: Credential
    }

    // MARK: - Credential
    public struct Credential: Codable {
        public let accessToken: String
        public let expiresIn: Int
    }

    // MARK: - User
    public struct User: Codable {
        public let id: Int
        public let nsaId: String
        public let imageUri: String
        public let name, supportId: String
        public let isChildRestricted: Bool
        public let etag: String
        public let links: Links
        public let permissions: Permissions
        public let presence: Presence
    }

    // MARK: - Links
    public struct Links: Codable {
        public let nintendoAccount: NintendoAccount
        public let friendCode: FriendCode
    }

    // MARK: - FriendCode
    public struct FriendCode: Codable {
        public let regenerable: Bool
        public let regenerableAt: Int
        public let id: String
    }

    // MARK: - NintendoAccount
    public struct NintendoAccount: Codable {
        public let membership: Membership
    }

    // MARK: - Membership
    public struct Membership: Codable {
        public let active: Bool
    }

    // MARK: - Permissions
    public struct Permissions: Codable {
        public let presence: String
    }

    // MARK: - Presence
    public struct Presence: Codable {
        public let state: String
        public let updatedAt, logoutAt: Int
        public let game: Game
    }

    // MARK: - Game
    public struct Game: Codable {
    }
}
