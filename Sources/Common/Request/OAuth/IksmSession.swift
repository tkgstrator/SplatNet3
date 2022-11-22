//
//  IksmSession.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

internal class IksmSession: RequestType {
    typealias ResponseType = IksmSession.Response

    var method: HTTPMethod = .get
    var baseURL = URL(unsafeString: "https://app.splatoon2.nintendo.net/")
    var path: String = ""
    var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    var headers: [String: String]?

    init(accessToken: String) {
        self.headers = [
            "Cookie": "iksm_session=",
            "X-GameWebToken": accessToken,
        ]
    }

    internal struct Response: Codable {
        var iksmSession: String
        var nsaid: String
    }
}
