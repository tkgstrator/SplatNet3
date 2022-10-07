//
//  XVersion.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/11/15.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//
// swiftlint:disable discouraged_optional_collection

import Alamofire
import Foundation

public struct XVersion: RequestType {
    public typealias ResponseType = XVersion.Response

    public var baseURL = URL(unsafeString: "https://itunes.apple.com/")
    public var method: HTTPMethod = .get
    public var path: String = "lookup?id=1234806557"
    public var parameters: Parameters?
    public var headers: [String: String]?

    public init() {}

    // MARK: - Response
    public struct Response: Codable {
        let resultCount: Int
        public let results: [Information]
    }

    // MARK: - ResultElement
    public struct Information: Codable {
        public let minimumOsVersion: String
        public let version: String
        public let currentVersionReleaseDate: String

        public init(from decoder: Decoder) throws {
            self.minimumOsVersion = "14.0.0"
            self.version = "2.3.1"
            self.currentVersionReleaseDate = ""
        }
    }
}

public struct Version: RequestType {
    public typealias ResponseType = Version.Response

    public var baseURL = URL(unsafeString: "https://apps.apple.com/")
    public var method: HTTPMethod = .get
    public var path: String = "app/id1234806557"
    public var parameters: Parameters?
    public var headers: [String: String]?

    public init() {}

    // MARK: - Response
    public struct Response: Codable {
        public let version: String

        public init(from: String) {
            if let version = from.capture(pattern: #"whats-new__latest__version">Version (.*)</p>"#, group: 1) {
                self.version = version
                return
            }
            self.version = "2.3.0"
        }
    }
}
