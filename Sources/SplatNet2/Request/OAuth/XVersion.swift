//
//  XVersion.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/11/15.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//
// swiftlint:disable discouraged_optional_collection

import Alamofire
import Common
import Foundation

public class XVersion: RequestType {
    public typealias ResponseType = XVersion.Response

    public var baseURL = URL(unsafeString: "https://itunes.apple.com/")
    public var method: HTTPMethod = .get
    public var path: String
    public var parameters: Parameters?
    public var headers: [String: String]?

    init() {
        self.path = "lookup?id=1234806557"
    }

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
    }
}
