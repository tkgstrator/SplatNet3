//
//  CoopStageId.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum CoopStageId: Int, CaseIterable, Identifiable, Codable {
    public var id: Int { rawValue }

    case Unknown        = -1
    case Tutorial       = 0
    case Shakeup        = 1
    case Shakespiral    = 2
    case Shakehouse     = 3
    case Shakelift      = 4
    case Shakeride      = 5
    case Shakeship      = 6
    case Shakedent      = 7

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let intValue: Int = try container.decode(Int.self)
        self = Self(rawValue: intValue) ?? .Unknown
    }
}
