//
//  SupportButton_SupportChallengeMutation.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import SplatNet

final class SupportButton_SupportChallengeMutation: GraphQL {
	public typealias ResponseType = SupportButton_SupportChallengeMutation.Response
	var hash: SHA256Hash = .SupportButton_SupportChallengeMutation
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

	public struct Response: Codable {
	}
}
