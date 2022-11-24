//
//  CoopHistoryDetailQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import Common

final class CoopHistoryDetailQuery: GraphQL {
	public typealias ResponseType = CoopHistoryDetailQuery.Response
	var hash: SHA256Hash = .CoopHistoryDetailQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

    init(resultId: String) {
        self.variables = [
            "coopHistoryDetailId": resultId
        ]
    }

	public struct Response: Codable {
	}
}
