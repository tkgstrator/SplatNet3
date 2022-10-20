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
    case Giant
    case Mudmouth
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
    case Giant
    case Mudmouth
}

public enum EventKey: String, CaseIterable {
    public var sha256Hash: String { rawValue }

    case Water_Levels       = "c3edad579f6ad3d2195a99c6ccbad74d74ddb6121d1476c6270436d90c8a475d"
    case Rush               = "fd468293bf7ee52c7b0ac1a2cdc3c14f0024817c58e96e82bd4b6411f9119d66"
    case Goldie_Seeking     = "a1c78221f5339e43241429febb44cabb6eac59c8e38ec568fb32e814b6fe3259"
    case Griller            = "447b1afa07c561e899df7e81aca5d25024c25642f43008d8e3869e9485b0f2e9"
    case The_Mothership     = "b5e5277056e51eef9abed19e58ba66156264b6bbed638e62f6e89050121f6ea4"
    case Fog                = "19b470fc944350da2f71dcd7dc939efa5441fb812bb435fb7c908ebe78ced1fb"
    case Cohock_Charge      = "02338462199c4ada0ba7ca86097da98b6ffc138e6a4a54f521ed351259d8adad"
    case Giant              = "3657f12385cd1cde2c9ce89144e2b5369cdea5bedc47ec602bda08e626ee9e7b"
    case Mudmouth           = "83112387a9106ecf254ca291f831fbbf5925f9712387449de2d8ca75796b6e7c"
}
