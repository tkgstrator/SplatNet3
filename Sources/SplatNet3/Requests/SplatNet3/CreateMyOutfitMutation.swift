//
//  CreateMyOutfitMutation.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire


final class CreateMyOutfitMutation: GraphQL {
	public typealias ResponseType = CreateMyOutfitMutation.Response
	var hash: SHA256Hash = .CreateMyOutfitMutation
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

	public struct Response: Codable {
	}
}
