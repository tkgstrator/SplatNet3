//
//  AccessToken.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

public class AccessToken: RequestType {
    public typealias ResponseType = AccessToken.Response

    public var method: HTTPMethod = .post
    public var baseURL = URL(unsafeString: "https://accounts.nintendo.com/")
    public var path: String = "connect/1.0.0/api/token"
    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var headers: [String: String]?

    /// セッショントークンコードから初期化
    public init(sessionToken: String) {
        self.parameters = [
            "client_id": "71b963c1b7b6d119",
            "grant_type": "urn:ietf:params:oauth:grant-type:jwt-bearer-session-token",
            "session_token": sessionToken,
        ]
    }

    /// セッショントークンコードから初期化
    public convenience init(sessionToken: SessionToken.Response) {
        self.init(sessionToken: sessionToken.sessionToken)
    }

    public struct Response: Codable {
        public let accessToken: String
        public let expiresIn: Int
        public let idToken: String
        public let scope: [String]
        public let tokenType: String
    }
}
