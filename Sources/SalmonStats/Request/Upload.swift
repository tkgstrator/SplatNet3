//
//  UploadResult.swift
//  SalmonStats
//
//  Created by tkgstrator on 2021/04/17.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire
import Common
import SplatNet2

public enum UploadStatus: String, CaseIterable, Codable {
    case created
    case updated
}

public class UploadResult: RequestType {
    public typealias ResponseType = UploadResult.Response

    public var method: HTTPMethod = .post
    public var path: String = "results"
    public var encoding: ParameterEncoding = JSONEncoding.default
    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var headers: [String: String]?

    // 複数アップロード
    init(results: [CoopResult.Response]) {
        self.parameters = ["results": results.map({ $0.asJSON() })]
    }

    // 単一アップロード
    init(result: CoopResult.Response) {
        self.parameters = ["results": [result.asJSON()]]
    }

    public struct Response: Codable {
        public let results: [Result]

        public struct Result: Codable {
            public var status: UploadStatus
            public var salmonId: Int
        }
    }
}


extension RequestType {
    public var baseURL: URL {
        URL(unsafeString: "https://api.splatnet2.com/v1/")
    }
}
