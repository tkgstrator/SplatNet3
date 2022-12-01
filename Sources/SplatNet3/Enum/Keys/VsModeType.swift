//
//  VsModeType.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum VsModeKey: String, CaseIterable, Identifiable, Codable {
    public var id: String { rawValue }

    case UNKNOWN
    case REGULAR
    case BANKARA
    case PRIVATE

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue: String = try container.decode(String.self)
        self = Self(rawValue: stringValue) ?? .UNKNOWN
    }
}
