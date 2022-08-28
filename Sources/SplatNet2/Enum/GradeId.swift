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

    // エンコード時に数値から文字列に変換する
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode("\(rawValue)")
    }

    // デコード時に文字列から数値に変換する
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

public enum GradeKey: String, Codable, CaseIterable {
    case profreshional
    case overachiver
    case gogetter
    case parttimer
    case apparentice
    case intern
}

extension GradeId: Identifiable {
    public var id: Int { rawValue }
}

extension GradeKey: Identifiable {
    public var id: String { rawValue }
}
