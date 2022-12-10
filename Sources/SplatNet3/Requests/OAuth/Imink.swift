//
//  Imink.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

/// Imink
class Imink: RequestType {
    typealias ResponseType = Imink.Response

    var method: HTTPMethod = .post
    var baseURL: URL
    var path: String
    var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    var headers: [String: String]?

    init(accessToken: AccessToken.Response, server: ServerType = .Imink) {
        self.baseURL = URL(unsafeString: server.rawValue)
        self.path = server.path
        self.parameters = [
            "token": accessToken.accessToken,
            "hash_method": String(IminkType.nso.rawValue),
        ]
    }

    init(accessToken: GameServiceToken.Response, server: ServerType = .Imink) {
        self.baseURL = URL(unsafeString: server.rawValue)
        self.path = server.path
        self.parameters = [
            "token": accessToken.result.webApiServerCredential.accessToken,
            "hash_method": String(IminkType.app.rawValue),
        ]
    }

    enum ServerType: String, CaseIterable {
        case Imink  = "https://api.imink.app/"
        case Flapg  = "https://flapg.com/"
        case Nxapi  = "https://nxapi-znca-api.fancy.org.uk"

        var path: String {
            switch self {
            case .Imink:
                return "f"
            case .Flapg:
                return "ika/api/login-main"
            case .Nxapi:
                return "api/znca/f"
            }
        }
    }

    enum IminkType: Int, CaseIterable {
        case app = 2
        case nso = 1
    }

    struct Response: Codable {
        let f: String
        let requestId: String
        let timestamp: UInt64
    }
}
