//
//  GradeId.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public enum GradeId: Int, Codable, CaseIterable {
    case profreshional  = 5
    case overachiver    = 4
    case gogetter       = 3
    case parttimer      = 2
    case apparentice    = 1
    case intern         = 0

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode("\(rawValue)")
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue = try container.decode(String.self)
        guard let intValue = Int(stringValue) else {
            throw DecodingError.typeMismatch(
                Int.self,
                .init(
                    codingPath: container.codingPath,
                    debugDescription: "Response value could not cast as Int",
                    underlyingError: nil
                )
            )
        }
        guard let rawValue = GradeId(rawValue: intValue) else {
            throw DecodingError.typeMismatch(
                GradeId.self,
                .init(
                    codingPath: container.codingPath,
                    debugDescription: "Cannot initialize GradeId from invalid Int value \(intValue)",
                    underlyingError: nil
                )
            )
        }
        self = rawValue
    }
}

public extension GradeId {
    var id: Int { rawValue }
}
