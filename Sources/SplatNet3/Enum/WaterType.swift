//
//  WaterType.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/08/13.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation

public enum WaterType: RawRepresentables {
    public init?(id: Int?) {
        if let id = id {
            self.init(WaterId(rawValue: id))
        }

        return nil
    }

    public init?(id: Int) {
        self.init(WaterId(rawValue: id))
    }

    public init?(hash: String) {
        self.init(WaterKey(rawValue: hash))
    }

    public subscript<V>(dynamicMember keyPath: KeyPath<WaterId, V>) -> V? {
      self[keyPath]
    }

    public subscript<V>(dynamicMember keyPath: KeyPath<WaterKey, V>) -> V? {
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
    public var id: Int { rawValue }
    case Low_Tide
    case Middle_Tide
    case High_Tide
}

public enum WaterKey: String, CaseIterable {
    public var sha256Hash: String { rawValue }

    case Low_Tide       = "0a2a1ec6c93ff93a003bacf3082c6e79d7be7ce75aa68ae885c8ec14d658e9c6"
    case Middle_Tide    = "b38e6eae48f980d5fedf4d4b32c511f8f2f246ee7c3062c9386455e90b5f7c41"
    case High_Tide      = "526e505f8816a1ef36d3b648adc3a31bcc69c4da79ab8d779c8074547b902657"
}
