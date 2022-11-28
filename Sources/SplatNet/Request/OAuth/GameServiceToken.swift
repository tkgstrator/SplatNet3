//
//  GameServiceToken.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

/// GameServiceToken
class GameServiceToken: RequestType {
    typealias ResponseType = GameServiceToken.Response

    var method: HTTPMethod = .post
    var baseURL: URL = URL(unsafeString: "https://api-lp1.znc.srv.nintendo.net/")
    var path: String = "v3/Account/Login"
    var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    var headers: [String: String]?

    init(imink: Imink.Response, accessToken: AccessToken.Response, version: XVersion.Response) {
        self.headers = [
            "X-ProductVersion": "\(version.version)",
            "X-Platform": "Android",
        ]
        self.parameters = [
            "parameter": [
                "f": imink.f,
                "naIdToken": accessToken.accessToken,
                "timestamp": imink.timestamp,
                "requestId": imink.requestId,
                "naCountry": "JP",
                "naBirthday": "1990-01-01",
                "language": "ja-JP",
            ],
        ]
    }

    // MARK: - Response
    struct Response: Codable {
        let status: Int
        let result: Result
        let correlationId: String
    }

    // MARK: - Result
    struct Result: Codable {
        let user: User
        let webApiServerCredential: Credential
        let firebaseCredential: Credential
    }

    // MARK: - Credential
    struct Credential: Codable {
        let accessToken: String
        let expiresIn: Int
    }

    // MARK: - User
    struct User: Codable {
        let id: Int
        let nsaId: String
        let imageUri: String
        let name, supportId: String
        let isChildRestricted: Bool
        let etag: String
        let links: Links
        let permissions: Permissions
        let presence: Presence
    }

    // MARK: - Links
    struct Links: Codable {
        let nintendoAccount: NintendoAccount
        let friendCode: FriendCode
    }

    // MARK: - FriendCode
    struct FriendCode: Codable {
        let regenerable: Bool
        let regenerableAt: Int
        let id: String
    }

    // MARK: - NintendoAccount
    struct NintendoAccount: Codable {
        let membership: Membership
    }

    // MARK: - Membership
    struct Membership: Codable {
        let active: Bool
    }

    // MARK: - Permissions
    struct Permissions: Codable {
        let presence: String
    }

    // MARK: - Presence
    struct Presence: Codable {
        let state: String
        let updatedAt, logoutAt: Int
        let game: Game
    }

    // MARK: - Game
    struct Game: Codable {
    }
}
