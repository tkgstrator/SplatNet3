//
//  Imink.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

public class Imink: RequestType {
    public typealias ResponseType = Imink.Response

    public var method: HTTPMethod = .post
    public var baseURL = URL(unsafeString: "https://api.imink.app")
    public var path: String = "f"
    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var headers: [String: String]?

    public init(accessToken: AccessToken.Response) {
        self.parameters = [
            "token": accessToken.accessToken,
            "hash_method": String(IminkType.nso.rawValue),
        ]
    }

    public init(accessToken: GameServiceToken.Response) {
        self.parameters = [
            "token": accessToken.result.webApiServerCredential.accessToken,
            "hash_method": String(IminkType.app.rawValue),
        ]
    }

    public enum IminkType: Int, CaseIterable {
        case app = 2
        case nso = 1
    }

    public struct Response: Codable {
        let f: String
        let requestId: String
        let timestamp: UInt64
    }
}
