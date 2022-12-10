//
//  GameWebToken.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

/// GameWebToken
class GameWebToken: RequestType {
    typealias ResponseType = GameWebToken.Response

    var method: HTTPMethod = .post
    var baseURL: URL = URL(unsafeString: "https://api-lp1.znc.srv.nintendo.net/")
    var path: String = "v2/Game/GetWebServiceToken"
    var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    var headers: [String: String]?

    init(imink: Imink.Response, accessToken: GameServiceToken.Response, contentId: ContentId, version: XVersion.Response) {
        self.headers = [
            "X-Platform": "Android",
            "X-ProductVersion": "\(version.version)",
            "Authorization": "Bearer \(accessToken.result.webApiServerCredential.accessToken)",
        ]
        self.parameters = [
            "parameter": [
                "f": imink.f,
                "id": contentId.rawValue,
                "registrationToken": accessToken.result.webApiServerCredential.accessToken,
                "timestamp": imink.timestamp,
                "requestId": imink.requestId,
            ],
        ]
    }

    struct Response: Codable {
        let correlationId: String
        let result: AccessToken
        let status: Int

        struct AccessToken: Codable {
            let accessToken: String
            let expiresIn: Int
        }
    }
}
