//
//  WaterType.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/08/13.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation

public enum WaterType: RawRepresentables {
    init?(id: Int?) {
        if let id = id {
            self.init(WaterId(rawValue: id))
        }

        return nil
    }

    init?(id: Int) {
        self.init(WaterId(rawValue: id))
    }

    init?(hash: String) {
        self.init(WaterKey(rawValue: hash))
    }

    subscript<V>(dynamicMember keyPath: KeyPath<WaterId, V>) -> V? {
      self[keyPath]
    }

    subscript<V>(dynamicMember keyPath: KeyPath<WaterKey, V>) -> V? {
      self[keyPath]
    }

    public var localizedText: String {
        NSLocalizedString(self.sha256Hash ?? "Unknown Value", bundle: .module, comment: "")
    }

    case Low_Tide
    case Middle_Tide
    case High_Tide
}

public enum WaterId: Int, CaseIterable {
    case Low_Tide
    case Middle_Tide
    case High_Tide
}

public enum WaterKey: String, CaseIterable {
    var sha256Hash: String { rawValue }

    #warning("データがないので仮割当")
    case Low_Tide       = "55d434662f0976490d8791b3242c1494022602b4e026a4d4804c8a880862bb3e"
    case Middle_Tide    = "b9710c77af3bb946ed2990c09104a20bd7b98a3852dd95e09a0647edc5693733"
    case High_Tide      = "9d6ff8f3cf2247c1dd604c97f52c8d92320d6290922491b1410ae2563a576a16"
}
