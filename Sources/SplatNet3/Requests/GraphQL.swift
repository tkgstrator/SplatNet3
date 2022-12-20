//
//  GraphQL.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

public protocol GraphQL: RequestType {
    var hash: SHA256Hash { get }
    var version: Int { get }
    var variables: [String: String] { get }
}

public extension GraphQL {
    var baseURL: URL {
        URL(unsafeString: "https://api.lp1.av5ja.srv.nintendo.net/")
    }

    var method: HTTPMethod {
        .post
    }

    var path: String {
        "api/graphql"
    }

    var headers: [String : String]? {
        nil
    }

    var version: Int {
        1
    }

    func asURLRequest() throws -> URLRequest {
        // swiftlint:disable:next force_unwrapping
        let url: URL = URL(unsafeString: baseURL.appendingPathComponent(path).absoluteString.removingPercentEncoding!)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10)
        request.allHTTPHeaderFields = headers
        // UAを設定
        request.headers.update(.userAgent("SplatNet3/@tkgling"))
        // パラメータを設定
        let parameters: Parameters = [
            "variables": variables,
            "extensions": [
                "persistedQuery": [
                    "version": version,
                    "sha256Hash": hash.rawValue
                ]
            ]
        ]
        return try encoding.encode(request, with: parameters)
    }
}
