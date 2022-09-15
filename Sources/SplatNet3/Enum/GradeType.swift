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

    public var localizedText: String {
        NSLocalizedString(self.sha256Hash ?? "Unknown Value", bundle: .module, comment: "")
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
    var sha256Hash: String { rawValue }

    case Apprentice             = "e644f83d679df0bb7325778eaeffba7251eb44583a3a58266263699194ab1f74"
    case Part_Timer             = "f17aafa283b87ec7837a4cea5e81591ea652b46d17de8ce6c65c638fbe98cf61"
    case Go_Getter              = "7261f66673725c3ef70dc285ee4b5419c0983f8728d67da61e17218eafd0528f"
    case Overachiever           = "8b571d53feec3adf98d112cb5e17d17b1d0663307bedf2cbdc1b607eafc336e3"
    case Profreshional          = "f6c91ebc8d14c8963c59286e456ce3f8f68f6414b8ee516bf5137a84e7777021"
    case Profreshional_1        = "d2a5d5aba604e96d2dc9f10c4b6503719b78d10c0279b5c0a78eeb2b9b49c879"
    case Profreshional_2        = "07d3c2ff1fea04e52aede9c793f12b988117ed667fcef5c7a061c10c101221ac"
    case Profreshional_3        = "1a1d337ff77cca15924aa4c399ff5eea03e93451fd7eb41924f4bf84ad654231"
    case Eggsecutive_VP         = "6e0208ab214e8c72006bc04c6a84fd1695c2d309265572b490b40e87064a5160"
}
