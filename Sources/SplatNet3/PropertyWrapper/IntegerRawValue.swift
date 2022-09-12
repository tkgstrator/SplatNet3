//
//  Base64EncodedString.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/11/20.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

@propertyWrapper
public struct StringAcceptable<T: LosslessStringConvertible>: Codable {
    public var wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)

        self.wrappedValue = T(rawValue)!
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        try container.encode(String(self.wrappedValue).data(using: .utf8)!.base64EncodedData())
    }

}

@propertyWrapper
public struct IntegerRawValue: Codable {
    public var wrappedValue: Int

    public init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = String(data: Data(base64Encoded: try container.decode(String.self))!, encoding: .utf8)!

        self.wrappedValue = Int(rawValue.capture(pattern: "([0-9]*)$", group: 1)!)!
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        try container.encode(String(self.wrappedValue).data(using: .utf8)!.base64EncodedString())
    }

}

@propertyWrapper
public struct IntegerIdRawValue: Codable {
    public var wrappedValue: Int

    public init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        self.wrappedValue = Int(String(String(data: Data(base64Encoded: try container.decode(String.self))!, encoding: .utf8)!.suffix(4)))!
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        try container.encode(String(self.wrappedValue).data(using: .utf8)!.base64EncodedString())
    }

}
