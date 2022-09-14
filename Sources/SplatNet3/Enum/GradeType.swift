//
//  GradeType.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/08/13.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation

public enum GradeType: RawRepresentables {
    init?(id: Int?) {
        if let id = id {
            self.init(GradeId(rawValue: id))
        }

        return nil
    }

    init?(id: Int) {
        self.init(GradeId(rawValue: id))
    }

    init?(hash: String) {
        self.init(GradeKey(rawValue: hash))
    }

    subscript<V>(dynamicMember keyPath: KeyPath<GradeId, V>) -> V? {
      self[keyPath]
    }

    subscript<V>(dynamicMember keyPath: KeyPath<GradeKey, V>) -> V? {
      self[keyPath]
    }

    case Apprentice
    case Part_Timer
    case Go_Getter
    case Overachiever
    case Profreshional
    case Profreshional_1
    case Profreshional_2
    case Profreshional_3
    case Eggsecutive_VP
}

public enum GradeId: Int, CaseIterable {
    case Apprentice
    case Part_Timer
    case Go_Getter
    case Overachiever
    case Profreshional
    case Profreshional_1
    case Profreshional_2
    case Profreshional_3
    case Eggsecutive_VP
}

public enum GradeKey: String, CaseIterable {
    public var localizedText: String {
        NSLocalizedString(rawValue, comment: "GradeKey")
    }

    case Apprentice
    case Part_Timer
    case Go_Getter
    case Overachiever
    case Profreshional
    case Profreshional_1
    case Profreshional_2
    case Profreshional_3
    case Eggsecutive_VP
}
