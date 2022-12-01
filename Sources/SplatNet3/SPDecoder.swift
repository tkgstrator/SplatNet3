//
//  SPDecoder.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public class SPDecoder: JSONDecoder {
    public override init() {
        super.init()
        self.dateDecodingStrategy = .iso8601
        self.keyDecodingStrategy = .convertFromSnakeCase
    }
}
