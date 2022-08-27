//
//  RequestType.swift
//  SplatNet2
//
//  Created by tkgstrator on 2022/08/27.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Foundation
import Common

public extension RequestType {
    var baseURL: URL {
        URL(unsafeString: "https://app.splatoon2.nintendo.net/api/")
    }
}
