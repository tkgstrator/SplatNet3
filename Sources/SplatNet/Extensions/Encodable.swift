//
//  Encodable.swift
//  
//
//  Created by tkgstrator on 2022/11/28.
//  
//

import Foundation

public extension Encodable {
    func asData() throws -> Data {
        let encoder: JSONEncoder = {
            let encoder: JSONEncoder = JSONEncoder()
            return encoder
        }()

        return try encoder.encode(self)
    }
}
