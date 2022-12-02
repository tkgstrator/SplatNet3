//
//  XRankingRefetchQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire


final class XRankingRefetchQuery: GraphQL {
	public typealias ResponseType = XRankingRefetchQuery.Response
	var hash: SHA256Hash = .XRankingRefetchQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

	public struct Response: Codable {
	}
}
