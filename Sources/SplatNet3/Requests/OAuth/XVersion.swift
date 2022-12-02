//
//  Version.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/11/15.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

/// Version(X-Product-Version)
class XVersion: RequestType {
    typealias ResponseType = XVersion.Response

    var baseURL: URL = URL(unsafeString: "https://apps.apple.com/")
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

        init(context: String) {
            self.version = context.capture(pattern: #"whats-new__latest__version">Version (.*)</p>"#, group: 1) ?? "2.3.1"
        }
    }
}
