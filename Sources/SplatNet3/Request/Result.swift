//
//  CoopResult.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Common
import Foundation

public struct CoopResult: RequestType {
    public typealias ResponseType = CoopResult.Response

    public var method: HTTPMethod = .get
    public var path: String
    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var headers: [String: String]?

    public init(resultId: Int) {
        self.path = "coop_results/\(resultId)"
    }

    public struct Response: Codable {
    }
}
