//
//  SaleGearDetailOrderGesotownGearMutation.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import SplatNet

final class SaleGearDetailOrderGesotownGearMutation: GraphQL {
	public typealias ResponseType = SaleGearDetailOrderGesotownGearMutation.Response
	var hash: SHA256Hash = .SaleGearDetailOrderGesotownGearMutation
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

	public struct Response: Codable {
	}
}
