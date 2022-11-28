//
//  PhotoAlbumRefetchQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire
import SplatNet

final class PhotoAlbumRefetchQuery: GraphQL {
	public typealias ResponseType = PhotoAlbumRefetchQuery.Response
	var hash: SHA256Hash = .PhotoAlbumRefetchQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

	public struct Response: Codable {
	}
}
