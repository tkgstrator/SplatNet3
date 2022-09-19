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

public class WebVersion: RequestType {
    public typealias ResponseType = WebVersion.Response

    public var method: HTTPMethod = .get
    public var baseURL = URL(unsafeString: "https://api.lp1.av5ja.srv.nintendo.net/")
    public var path: String = "static/js/main.cf1388fb.js"
    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var headers: [String: String]?

    public init() { }

    public struct Response: Codable {
        // バージョン
        let version: String
        // ハッシュ
        let hash: String

        public init(from response: String) {
            let matches: [String] = response.capture(pattern: #""(\d\.\d\.\d)-".*"([a-f0-9]{40})""#, group: [1, 2])

            self.version = matches[0]
            self.hash = String(matches[1].prefix(8))
        }

        public init(version: String, hash: String) {
            self.version = version
            self.hash = hash
        }

        public init(rawValue: String) {
            let matches: [String] = rawValue.capture(pattern: #"(\d\.\d\.\d)-([a-f0-9]{8})"#, group: [1, 2])
            self.version = matches[0]
            self.hash = matches[1]
        }
    }
}
