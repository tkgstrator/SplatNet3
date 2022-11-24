//
//  BankaraBattleHistoriesRefetchQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import Common

final class BankaraBattleHistoriesRefetchQuery: GraphQL {
	public typealias ResponseType = BankaraBattleHistoriesRefetchQuery.Response
	var hash: SHA256Hash = .BankaraBattleHistoriesRefetchQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

	public struct Response: Codable {
	}
}
