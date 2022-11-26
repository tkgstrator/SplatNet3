//
//  CoopStageKey.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum CoopStageKey: String, CaseIterable, Identifiable, Codable {
    public var id: String { rawValue }

    case Unknown        = "b764cdc0eab7137467211272fa539f1260d1bf2e71bcf6ff3bdc960f5c16aa14"
    case Tutorial       = "c26982b1425da26a9637dd69da684a036c8b67a1ddf2c3d09b915a96e4b58037"
    case ShakeUp        = "c746835556967c7c22178163baa18db46375eb31322627626006392f23457aa7"
    case ShakeSpiral    = "c60554392a0da8bde91b6bd61a43f346041e9482d324808bd5a5d167196ed0b8"
    case ShakeShip      = "ShakeShip"
    case ShakeHouse     = "ShakeHouse"
    case ShakeLift      = "ShakeLift"
    case ShakeRide      = "ShakeRide"
    case ShakeDent      = "8fe373c92b524b39cbae4d90aabdc718e705ef11bbfb2fab46c8fb88c735a401"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        let rawValue: String = try container.decode(String.self)
        self = CoopStageKey(rawValue: rawValue) ?? .Unknown
    }
}

public enum CoopStageThumbnailKey: String, CaseIterable, Identifiable, Codable {
    public var id: String { rawValue }

    case Unknown        = "Unknown"
    case Tutorial       = "Tutorial"
    case ShakeUp        = "be584c7c7f547b8cbac318617f646680541f88071bc71db73cd461eb3ea6326e"
    case ShakeSpiral    = "3418d2d89ef84288c78915b9acb63b4ad48df7bfcb48c27d6597920787e147ec"
    case ShakeShip      = "ShakeShip"
    case ShakeHouse     = "ShakeHouse"
    case ShakeLift      = "ShakeLift"
    case ShakeRide      = "ShakeRide"
    case ShakeDent      = "f1e4df4cff1dc5e0acc66a9654fecf949224f7e4f6bd36305d4600ac3fa3db7b"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        let rawValue: String = try container.decode(String.self)
        self = CoopStageThumbnailKey(rawValue: rawValue) ?? .Unknown
    }
}
