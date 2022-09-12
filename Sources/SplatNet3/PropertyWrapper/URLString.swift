//
//  URLRawValue.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/11/20.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

@propertyWrapper
public struct URLRawValue: Codable {
    public var wrappedValue: String

    public init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let baseURL: URL = URL(unsafeString: try container.decode(String.self))
        let component: String = baseURL.lastPathComponent
        let hash: String = String(component.dropLast(6))

        self.wrappedValue = String(hash)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        try container.encode(self.wrappedValue)
    }

}
