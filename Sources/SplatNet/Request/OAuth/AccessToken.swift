//
//  AccessToken.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

/// AccessToken
class AccessToken: RequestType {
    typealias ResponseType = AccessToken.Response

    var method: HTTPMethod = .post
    var baseURL: URL = URL(unsafeString: "https://accounts.nintendo.com/")
    var path: String = "connect/1.0.0/api/token"
    var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    var headers: [String: String]?

    /// セッショントークンコードから初期化
    init(sessionToken: String) {
        self.parameters = [
            "client_id": "71b963c1b7b6d119",
            "grant_type": "urn:ietf:params:oauth:grant-type:jwt-bearer-session-token",
            "session_token": sessionToken,
        ]
    }

    struct Response: Codable {
        let accessToken: String
        let expiresIn: Int
        let idToken: String
        let scope: [String]
        let tokenType: String
    }
}
