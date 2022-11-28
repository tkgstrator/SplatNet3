//
//  URLIdConvertible.swift
//  
//
//  Created by devonly on 2022/11/24.
//

import Foundation

@propertyWrapper
public struct SHA256HashRawValue<T: RawRepresentable>: Codable where T.RawValue == String {
    public var wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let baseURL: URL = URL(unsafeString: try container.decode(String.self))
        let component: String = baseURL.lastPathComponent

        #warning("これで正しいかどうかは微妙")
        let hash: String = String(component.dropLast(6))
        guard let value: T = T(rawValue: hash) else {
            throw DecodingError.valueNotFound(T.self, .init(codingPath: container.codingPath, debugDescription: "Given value \(hash) is not associated for \(T.self)"))
        }
        self.wrappedValue = value
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let hash: String = String(self.wrappedValue.rawValue)
        try container.encode(hash)
    }
}
