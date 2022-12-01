//
//  NullCodable.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/11/20.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

@propertyWrapper
public struct NullCodable<T>: Codable where T: Codable {
    public var wrappedValue: T?

    public init(wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            self.wrappedValue = try container.decode(T.self)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch wrappedValue {
            case .some(let value):
                try container.encode(value)
            case .none:
                try container.encodeNil()
        }
    }
}
