//
//  AccessToken.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Common
import Foundation

internal class AccessToken: RequestType {
    typealias ResponseType = AccessToken.Response

    var method: HTTPMethod = .post
    var baseURL = URL(unsafeString: "https://accounts.nintendo.com/")
    var path: String = "connect/1.0.0/api/token"
    var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    var headers: [String: String]?

    init(sessionToken: String) {
        self.parameters = [
            "client_id": "71b963c1b7b6d119",
            "grant_type": "urn:ietf:params:oauth:grant-type:jwt-bearer-session-token",
            "session_token": sessionToken,
        ]
    }

    init(sessionToken: SessionToken.Response) {
        self.parameters = [
            "client_id": "71b963c1b7b6d119",
            "grant_type": "urn:ietf:params:oauth:grant-type:jwt-bearer-session-token",
            "session_token": sessionToken.sessionToken,
        ]
    }

    internal struct Response: Codable {
        var accessToken: String
        var expiresIn: Int
        var idToken: String
        var scope: [String]
        var tokenType: String
    }
}
