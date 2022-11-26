//
//  HistoryRecordQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import Common

final class HistoryRecordQuery: GraphQL {
	public typealias ResponseType = HistoryRecordQuery.Response
	var hash: SHA256Hash = .HistoryRecordQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

	public struct Response: Codable {
	}
}