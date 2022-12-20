//
//  CoopStatsResultsQuery.swift
//
//
//  Created by devonly on 2022/12/04.
//

import Foundation
import Alamofire
import SwiftyJSON

public class CoopStatsResultsQuery: RequestType {
    public typealias ResponseType = [Response]
    #if DEBUG
    public var baseURL: URL = URL(unsafeString: "http://localhost:8080/")
    #else
    public var baseURL: URL = URL(unsafeString: "https://api.splatnet3.com/")
    #endif
    public var path: String = "v2/results"
    public var parameters: Parameters?
    public var headers: [String: String]?
    public var method: HTTPMethod = .post

    init(result: CoopResult) {
        self.parameters = [
            "results": [result].map({ $0.asJSON() })
        ]
    }

    init(results: [CoopResult]) {
        self.parameters = [
            "results": results.map({ $0.asJSON() })
        ]
    }

    public struct Response: Codable {
        public let id: String
        public let salmonId: Int
    }
}

fileprivate extension Encodable {
    func asJSON() -> [String: Any] {
        let encoder: JSONEncoder = {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .withoutEscapingSlashes
            encoder.dateEncodingStrategy = .iso8601
            return encoder
        }()
        guard let data = try? encoder.encode(self) else {
            return [:]
        }
        guard var dictionary: [String: Any] = try? JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed, .json5Allowed, .mutableContainers, .mutableLeaves]) as? [String: Any] else {
            return [:]
        }

        dictionary.forEach({ key, value -> Void in
            if value is Double && !(value is Int) {
                if let value = value as? Decimal {
                    dictionary[key] = value
                }
            }
        })

        return dictionary
    }
}
