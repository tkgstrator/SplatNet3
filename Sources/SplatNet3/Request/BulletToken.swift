//
//  BulletToken.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Common
import Foundation

internal class BulletToken: RequestType {
    typealias ResponseType = BulletToken.Response

    var method: HTTPMethod = .get
    var baseURL = URL(unsafeString: "https://api.lp1.av5ja.srv.nintendo.net/")
    var path: String = "api/bullet_tokens"
    var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    var headers: [String: String]?

    init(accessToken: SplatoonAccessToken.Response, version: String) {
        self.headers = [
            "X-Web-View-Ver": version,
            "X-NaCountry": "US",
            "X-GameWebToken": accessToken.result.accessToken,
        ]
    }

    internal struct Response: Codable {
        let bulletToken: String
        let lang: String
        let isNoeCountry: Bool
    }
}
