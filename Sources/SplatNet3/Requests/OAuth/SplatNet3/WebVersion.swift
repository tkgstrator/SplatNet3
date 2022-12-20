//
//  WebVersion.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

/// WebVersion
public class WebVersion: RequestType {
    public typealias ResponseType = WebVersion.Response

    public var method: HTTPMethod = .get
    public var baseURL = URL(unsafeString: "https://api.lp1.av5ja.srv.nintendo.net/")
    public var path: String = ""
    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var headers: [String: String]?

    public init() { }

    public struct Response: Codable {
        let hash: String

        init(context: String) {
            self.hash = context.capture(pattern: #"main\.([a-z0-9]{8})\.js"#, group: 1) ?? "bd36a652"
        }
    }
}
