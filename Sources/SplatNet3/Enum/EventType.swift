//
//  EventType.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/08/13.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation

public enum EventType: RawRepresentables {
    public init?(id: Int?) {
        if let id = id {
            self.init(EventId(rawValue: id))
        } else {
            return nil
        }
    }

    public init?(id: Int) {
        self.init(EventId(rawValue: id))
    }

    public init?(hash: String) {
        self.init(EventKey(rawValue: hash))
    }

    public subscript<V>(dynamicMember keyPath: KeyPath<EventId, V>) -> V? {
      self[keyPath]
    }

    public subscript<V>(dynamicMember keyPath: KeyPath<EventKey, V>) -> V? {
      self[keyPath]
    }

    public var localizedText: String {
        NSLocalizedString(self.sha256Hash ?? "Unknown Value", bundle: .module, comment: "")
    }

    case Water_Levels
    case Rush
    case Goldie_Seeking
    case Griller
    case The_Mothership
    case Fog
    case Cohock_Charge
    case Mudmouth
    case Giant
}

public enum EventId: Int, CaseIterable {
    public var id: Int { rawValue }
    case Water_Levels
    case Rush
    case Goldie_Seeking
    case Griller
    case The_Mothership
    case Fog
    case Cohock_Charge
    case Mudmouth
    case Giant
}

public enum EventKey: String, CaseIterable {
    public var sha256Hash: String { rawValue }

    case Water_Levels       = "c3edad579f6ad3d2195a99c6ccbad74d74ddb6121d1476c6270436d90c8a475d"
    case Rush               = "82e6cc3e8eb8f0ab22d84eae813f3da61ebef0fa0d79faf66a6378c530a2f7eb"
    case Goldie_Seeking     = "d79aa6202439b2e988b73568674c21fdd282bfb71fdcc7c8f173bfcf64e50370"
    case Griller            = "198c30be3ea18a6b237ccbf3865a509ab878017bf8695a49b2039774857377b4"
    case The_Mothership     = "c7aed9d8d6d8f32d080ec80cc87eae891817f9b5f73272e65553ebae7d0e1bd5"
    case Fog                = "235d53ced4bf574d22c6d77ba8d27d4f43529aa143d3b15f2275a06e3e93dffe"
    case Cohock_Charge      = "718dccf9ce30d24822f963d24c10887da64557f950e701914a0564dd1d2b983f"
    case Mudmouth           = "03985f469211fa99567dfd344c1a32aef6f4d83cdead80351a0340dcc2d70cc1"
    case Giant              = "0a052af0b1322f1d81d2d106879856f0308e7bccf94896ba3c77d220dab6a449"
}
