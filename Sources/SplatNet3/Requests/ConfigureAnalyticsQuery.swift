//
//  ConfigureAnalyticsQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import Common

final class ConfigureAnalyticsQuery: GraphQL {
	public typealias ResponseType = ConfigureAnalyticsQuery.Response
	var hash: SHA256Hash = .ConfigureAnalyticsQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

    // MARK: - Response
    public struct Response: Codable {
        public let data: DataClass
    }

    // MARK: - DataClass
    public struct DataClass: Codable {
        public let playHistory: PlayHistory
    }

    // MARK: - PlayHistory
    public struct PlayHistory: Codable {
        public let udemaeMax: String
        public let paintPointTotal: Int
        public let gameStartTime: String
        public let battleNumTotal: Int
        public let xMatchMaxAr: XMatchMax
        public let xMatchMaxCl: XMatchMax
        public let xMatchMaxGl: XMatchMax
        public let xMatchMaxLF: XMatchMax
    }

    // MARK: - XMatchMax
    public struct XMatchMax: Codable {
//        public let rank: JSONNull?
    }
}
