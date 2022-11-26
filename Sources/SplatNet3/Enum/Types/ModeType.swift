//
//  RuleType.swift
//  
//
//  Created by devonly on 2022/11/24.
//

import Foundation

public enum RuleType: String, CaseIterable, Codable {
    public var id: String { rawValue }

    case UNKNOWN
    case REGULAR

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue: String = try container.decode(String.self)
        self = Self(rawValue: stringValue) ?? .UNKNOWN
    }
}
