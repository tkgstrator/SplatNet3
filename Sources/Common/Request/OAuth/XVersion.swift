//
//  XVersion.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/11/15.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

/// XVersion(X-Product-Version)
struct XVersion: RequestType {
    typealias ResponseType = XVersion.Response

    var baseURL = URL(unsafeString: "https://itunes.apple.com/")
    var method: HTTPMethod = .get
    var path: String = "lookup?id=1234806557"
    var parameters: Parameters?
    // swiftlint:disable discouraged_optional_collection
    var headers: [String: String]?

    init() {}

    // MARK: - Response
    struct Response: Codable {
        let resultCount: Int
        let results: [Information]
    }

    // MARK: - ResultElement
    struct Information: Codable {
        let minimumOsVersion: String
        let version: String
        let currentVersionReleaseDate: String

        init(from decoder: Decoder) throws {
            self.minimumOsVersion = "14.0.0"
            self.version = "2.3.1"
            self.currentVersionReleaseDate = ""
        }
    }
}

struct Version: RequestType {
    typealias ResponseType = Version.Response

    var baseURL = URL(unsafeString: "https://apps.apple.com/")
    var method: HTTPMethod = .get
    var path: String
    var parameters: Parameters?
    var headers: [String: String]?

    init(id: String = "1234806557") {
        self.path = "app/id\(id)"
    }

    // MARK: - Response
    struct Response: Codable {
        let version: String

        init(from: String) {
            if let version = from.capture(pattern: #"whats-new__latest__version">Version (.*)</p>"#, group: 1) {
                self.version = version
                return
            }
            self.version = "2.3.1"
        }
    }
}
