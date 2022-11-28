//
//  MyOutfitCommonDataEquipmentsQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import SplatNet

final class MyOutfitCommonDataEquipmentsQuery: GraphQL {
	public typealias ResponseType = MyOutfitCommonDataEquipmentsQuery.Response
	var hash: SHA256Hash = .MyOutfitCommonDataEquipmentsQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

	public struct Response: Codable {
	}
}
