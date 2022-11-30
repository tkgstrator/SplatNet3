//
//  StageType.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/08/13.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation

public enum StageType: RawRepresentables {
    public var id: Int { self.rawValue }

    public var rawValue: Int { self.key! }

    public init?(id: Int?) {
        if let id = id {
            self.init(StageId(rawValue: id))
        }

        return nil
    }

    public init?(id: Int) {
        self.init(StageId(rawValue: id))
    }

    public init?(hash: String) {
        self.init(StageKey(rawValue: hash))
    }

    public subscript<V>(dynamicMember keyPath: KeyPath<StageId, V>) -> V? {
      self[keyPath]
    }

    public subscript<V>(dynamicMember keyPath: KeyPath<StageKey, V>) -> V? {
      self[keyPath]
    }

    public var localizedText: String {
        NSLocalizedString(self.sha256Hash ?? "Unknown Value", bundle: .module, comment: "")
    }

    case Unknown
    case Tutorial
    case Shakeup
    case Shakespiral
    case Shakeship
    case Shakehouse
    case Shakelift
    case Shakeride
    case Shakedent
}

public enum StageId: Int, CaseIterable {
    public var key: Int { rawValue }
    
    case Unknown        = -1
    case Tutorial       = 0
    case Shakeup        = 1
    case Shakespiral    = 2
    case Shakeship      = 6
    case Shakehouse     = 4
    case Shakelift      = 5
    case Shakeride      = 3
    case Shakedent      = 7
}

public enum StageKey: String, CaseIterable {
    public var sha256Hash: String { rawValue }

    case Unknown        = "ffa84f05a6437395a0a128cad1a99e8dd0f303ce4fd687fa648617a0075d7ad9"
    case Tutorial       = "744f65e62b538b63128469805c23592429f9830de7a1c12fdc910941fbeedfc4"
    case Shakeup        = "be584c7c7f547b8cbac318617f646680541f88071bc71db73cd461eb3ea6326e"
    case Shakespiral    = "3418d2d89ef84288c78915b9acb63b4ad48df7bfcb48c27d6597920787e147ec"
    case Shakeship      = "1a29476c1ab5fdbc813e2df99cd290ce56dfe29755b97f671a7250e5f77f4961"
    case Shakehouse     = "913f866ec025356131b85c94d185e3f361c28053a7c65a72b2d861f2c3f0d277"
    case Shakelift      = "b28206c853a342f236a6b64a4768451c60ba09341cb6e7c11e8e1a5353cfaa77"
    case Shakeride      = "0b0376955f3909e9e95b81c640c66094f8f5d6b316d4fdf89f865dd332d6a13a"
    case Shakedent      = "f1e4df4cff1dc5e0acc66a9654fecf949224f7e4f6bd36305d4600ac3fa3db7b"
}
