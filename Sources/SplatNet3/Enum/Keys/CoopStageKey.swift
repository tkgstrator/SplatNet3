//
//  CoopStageKey.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum CoopStageKey: String, CaseIterable, Identifiable, Codable {
    public var id: String { rawValue }

    case Unknown        = "ffa84f05a6437395a0a128cad1a99e8dd0f303ce4fd687fa648617a0075d7ad9"
    case Tutorial       = "744f65e62b538b63128469805c23592429f9830de7a1c12fdc910941fbeedfc4"
    case Shakeup        = "be584c7c7f547b8cbac318617f646680541f88071bc71db73cd461eb3ea6326e"
    case Shakespiral    = "3418d2d89ef84288c78915b9acb63b4ad48df7bfcb48c27d6597920787e147ec"
    case Shakehouse     = "913f866ec025356131b85c94d185e3f361c28053a7c65a72b2d861f2c3f0d277"
    case Shakelift      = "b28206c853a342f236a6b64a4768451c60ba09341cb6e7c11e8e1a5353cfaa77"
    case Shakeride      = "0b0376955f3909e9e95b81c640c66094f8f5d6b316d4fdf89f865dd332d6a13a"
    case Shakeship      = "1a29476c1ab5fdbc813e2df99cd290ce56dfe29755b97f671a7250e5f77f4961"
    case Shakedent      = "f1e4df4cff1dc5e0acc66a9654fecf949224f7e4f6bd36305d4600ac3fa3db7b"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        let rawValue: String = try container.decode(String.self)
        self = CoopStageKey(rawValue: rawValue) ?? .Unknown
    }
}
