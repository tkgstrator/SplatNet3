//
//  Results.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Common
import Foundation

public class Results: RequestType {
    public typealias ResponseType = Results.Response

    public var method: HTTPMethod = .get
    public var path: String = "coop_results"
    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var headers: [String: String]?

    init() {}

    public struct Response: Codable {
    }
}
