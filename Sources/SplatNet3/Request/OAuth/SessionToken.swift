//
//  SessionToken.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

/// SessionToken
class SessionToken: RequestType {
    typealias ResponseType = SessionToken.Response

    var method: HTTPMethod = .post
    var baseURL: URL = URL(unsafeString: "https://accounts.nintendo.com/")
    var path: String = "connect/1.0.0/api/session_token"
    var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    var headers: [String: String]?

    /// トークンコードとベリファイアから初期化
    init(code: String, verifier: String) {
        self.parameters = [
            "client_id": "71b963c1b7b6d119",
            "session_token_code": code,
            "session_token_code_verifier": verifier,
        ]
    }

    struct Response: Codable {
        let code: String
        let sessionToken: String
    }
}
