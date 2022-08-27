//
//  Imink.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Common
import Foundation

internal class Imink: RequestType {
    typealias ResponseType = Imink.Response

    var method: HTTPMethod = .post
    var baseURL = URL(unsafeString: "https://api.imink.app")
    var path: String = "f"
    var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    var headers: [String: String]?

    init(accessToken: AccessToken.Response) {
        self.parameters = [
            "token": accessToken.accessToken,
            "hash_method": String(IminkType.nso.rawValue),
        ]
    }

    init(accessToken: SplatoonToken.Response) {
        self.parameters = [
            "token": accessToken.result.webApiServerCredential.accessToken,
            "hash_method": String(IminkType.app.rawValue),
        ]
    }

    enum IminkType: Int, CaseIterable {
        case app = 2
        case nso = 1
    }

    internal struct Response: Codable {
        let f: String
        let requestId: String
        let timestamp: UInt64
    }
}
