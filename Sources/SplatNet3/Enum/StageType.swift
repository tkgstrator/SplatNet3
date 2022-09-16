//
//  StageType.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/08/13.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation

public enum StageType: RawRepresentables {
    init?(id: Int?) {
        if let id = id {
            self.init(StageId(rawValue: id))
        }

        return nil
    }

    init?(id: Int) {
        self.init(StageId(rawValue: id))
    }

    init?(hash: String) {
        self.init(StageKey(rawValue: hash))
    }

    subscript<V>(dynamicMember keyPath: KeyPath<StageId, V>) -> V? {
      self[keyPath]
    }

    subscript<V>(dynamicMember keyPath: KeyPath<StageKey, V>) -> V? {
      self[keyPath]
    }

    public var localizedText: String {
        NSLocalizedString(self.sha256Hash ?? "Unknown Value", bundle: .module, comment: "")
    }

    case Unknown
    case Tutorial
    case Shakeup
    case Shakespiral
    case Shakedent
}

public enum StageId: Int, CaseIterable {
    case Unknown        = -1
    case Tutorial       = 0
    case Shakeup        = 1
    case Shakespiral    = 2
    case Shakedent      = 7
}

public enum StageKey: String, CaseIterable {
    var sha256Hash: String { rawValue }

    case Unknown        = "b764cdc0eab7137467211272fa539f1260d1bf2e71bcf6ff3bdc960f5c16aa14"
    case Tutorial       = "c26982b1425da26a9637dd69da684a036c8b67a1ddf2c3d09b915a96e4b58037"
    case Shakeup        = "c746835556967c7c22178163baa18db46375eb31322627626006392f23457aa7"
    case Shakespiral    = "c60554392a0da8bde91b6bd61a43f346041e9482d324808bd5a5d167196ed0b8"
    case Shakedent      = "8fe373c92b524b39cbae4d90aabdc718e705ef11bbfb2fab46c8fb88c735a401"
}
