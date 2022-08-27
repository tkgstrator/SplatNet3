//
//  SpecialId.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public enum SpecialId: Int, Codable, CaseIterable, Identifiable {
    case splatBombLauncher  = 2
    case stingRay           = 7
    case inkjet             = 8
    case splashdown         = 9

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
        guard let rawValue = SpecialId(rawValue: intValue) else {
            throw DecodingError.typeMismatch(
                BossId.self,
                .init(
                    codingPath: container.codingPath,
                    debugDescription: "Cannot initialize SpecialId from invalid Int value \(intValue)",
                    underlyingError: nil
                )
            )
        }
        self = rawValue
    }
}

public extension SpecialId {
    var id: Int { rawValue }
}
