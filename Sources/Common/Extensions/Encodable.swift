//
//  Encodable.swift
//  Common
//
//  Created by tkgstrator on 2021/04/17.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public extension Encodable {
    func asString() throws -> String {
        let encoder: JSONEncoder = {
            let encoder: JSONEncoder = JSONEncoder()
//            encoder.keyEncodingStrategy = .convertToSnakeCase
            return encoder
        }()

        return String(data: try encoder.encode(self), encoding: .utf8)!
    }

    func asData() throws -> Data {
        let encoder: JSONEncoder = {
            let encoder: JSONEncoder = JSONEncoder()
//            encoder.keyEncodingStrategy = .convertToSnakeCase
            return encoder
        }()

        return try encoder.encode(self)
    }

    func asJSON(keyEncodingStragety: JSONEncoder.KeyEncodingStrategy = .convertToSnakeCase) -> [String: Any] {
        let encoder: JSONEncoder = {
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = keyEncodingStragety
            encoder.outputFormatting = .withoutEscapingSlashes
            return encoder
        }()
        guard let data = try? encoder.encode(self),
              let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        else {
            return [:]
        }
        return json
    }
}
