//
//  HeroHistoryRefetchQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import Common

final class HeroHistoryRefetchQuery: GraphQL {
	public typealias ResponseType = HeroHistoryRefetchQuery.Response
	var hash: SHA256Hash = .HeroHistoryRefetchQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

	public struct Response: Codable {
	}
}