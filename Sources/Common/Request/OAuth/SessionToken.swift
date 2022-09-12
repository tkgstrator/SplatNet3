//
//  SessionToken.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

public class SessionToken: RequestType {
    public typealias ResponseType = SessionToken.Response

    public var method: HTTPMethod = .post
    public var baseURL = URL(unsafeString: "https://accounts.nintendo.com/")
    public var path: String = "connect/1.0.0/api/session_token"
    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var headers: [String: String]?

    public init(code: String, verifier: String) {
        self.parameters = [
            "client_id": "71b963c1b7b6d119",
            "session_token_code": code,
            "session_token_code_verifier": verifier,
        ]
    }

    public struct Response: Codable {
        public let code: String
        public let sessionToken: String
    }
}
