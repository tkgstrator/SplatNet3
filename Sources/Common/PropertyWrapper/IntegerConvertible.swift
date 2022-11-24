//
//  IntegerConvertible.swift
//  
//
//  Created by devonly on 2022/11/24.
//

import Foundation

@propertyWrapper
public struct IntegerConvertible: Codable {
    public var wrappedValue: Int

    public init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        guard let data: Data = Data(base64Encoded: try container.decode(String.self)),
              let rawValue: String = String(data: data, encoding: .utf8),
              let stringInt: String = rawValue.capture(pattern: "([0-9]*)$", group: 1),
              let intValue: Int = Int(stringInt)
        else {
            throw DecodingError.typeMismatch(Int.self, .init(codingPath: container.codingPath, debugDescription: "Given value could not cast as Int"))
        }
        self.wrappedValue = intValue
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        guard let data: Data = String(self.wrappedValue).data(using: .utf8) else {
            throw EncodingError.invalidValue(self.wrappedValue, .init(codingPath: container.codingPath, debugDescription: "Given value could not cast as Data"))
        }

        try container.encode(data)
    }
}
