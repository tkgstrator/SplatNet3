//
//  BossId.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Common
import Foundation

 public enum BossId: Int, Codable, CaseIterable, CodableDictionaryKey, Identifiable {
    case goldie     = 3
    case steelhead  = 6
    case flyfish    = 9
    case scrapper   = 12
    case steelEel   = 13
    case stinger    = 14
    case maws       = 15
    case griller    = 16
    case drizzler   = 21

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
        guard let rawValue = BossId(intValue: intValue) else {
            throw DecodingError.typeMismatch(
                BossId.self,
                .init(
                    codingPath: container.codingPath,
                    debugDescription: "Cannot initialize BossId from invalid Int value \(intValue)",
                    underlyingError: nil
                )
            )
        }
        self = rawValue
    }
 }

public enum BossKey: String, Codable, CaseIterable, Identifiable {
    case sakelienGolden     = "sakelien-golden"
    case sakelienBomber     = "sakelien-bomber"
    case sakelienCupTwins   = "sakelien-cup-twins"
    case sakelienShield     = "sakelien-shield"
    case sakelienSnake      = "sakelien-snake"
    case sakelienTower      = "sakelien-tower"
    case sakediver          = "sakediver"
    case sakedozer          = "sakedozer"
    case sakerocket         = "sakerocket"
}

public extension BossKey {
    var id: String { rawValue }
}

public extension BossId {
    var id: Int { rawValue }
}
