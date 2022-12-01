//
//  IntegerConvertible.swift
//  
//
//  Created by devonly on 2022/11/24.
//

import Foundation

@propertyWrapper
public struct IntegerRawValue<T: RawRepresentable>: Codable where T.RawValue == Int {
    public var wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue: String = try container.decode(String.self)

        guard let data: Data = Data(base64Encoded: stringValue),
              let stringValue: String = String(data: data, encoding: .utf8),
              let capture: String = stringValue.capture(pattern: "([0-9]*)$", group: 1),
              let intValue: Int = Int(capture),
              let value: T = T(rawValue: intValue) else {
            throw DecodingError.valueNotFound(T.self, .init(codingPath: container.codingPath, debugDescription: "Given value \(stringValue) is not associated for \(T.self)"))
        }
        self.wrappedValue = value
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let hash: String = String(self.wrappedValue.rawValue)
        try container.encode(hash)
    }
}
