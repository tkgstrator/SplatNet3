//
//  Dictionary.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == String {
    var queryString: String {
        self.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
    }
}
