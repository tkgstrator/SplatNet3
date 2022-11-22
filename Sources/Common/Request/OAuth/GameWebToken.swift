//
//  GameWebToken.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

public class GameWebToken: RequestType {
    public typealias ResponseType = GameWebToken.Response

    public var method: HTTPMethod = .post
    public var baseURL = URL(unsafeString: "https://api-lp1.znc.srv.nintendo.net/")
    public var path: String = "v2/Game/GetWebServiceToken"
    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var headers: [String: String]?

    public init(imink: Imink.Response, accessToken: GameServiceToken.Response, version: String, authType: OAuthType) {
        self.headers = [
            "X-Platform": "Android",
            "Authorization": "Bearer \(accessToken.result.webApiServerCredential.accessToken)",
        ]
        self.parameters = [
            "parameter": [
                "f": imink.f,
                "id": authType.rawValue,
                "registrationToken": accessToken.result.webApiServerCredential.accessToken,
                "timestamp": imink.timestamp,
                "requestId": imink.requestId,
            ],
        ]
    }

    public struct Response: Codable {
        public let correlationId: String
        public let result: AccessToken
        public let status: Int

        public struct AccessToken: Codable {
            public let accessToken: String
            public let expiresIn: Int
        }
    }
}
