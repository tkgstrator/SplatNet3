//
//  SwiftUI+Image.swift
//  
//
//  Created by devonly on 2022/09/22.
//

import Foundation
import SwiftUI

public extension Image {
    init(bundle: NamePlateType) {
        self.init("NamePlate/\(bundle.rawValue)", bundle: .module)
    }

    init(bundle: BadgeType) {
        self.init("Badge/\(bundle.rawValue)", bundle: .module)
    }

    init(bundle: ScaleType) {
        self.init("Scale/\(bundle.rawValue)", bundle: .module)
    }

    init(bundle: WeaponType) {
        let rawValue: Int = bundle.id ?? 0

        self.init("Weapon/\(rawValue)", bundle: .module)
    }

    init(bundle: StageType) {
        let rawValue: Int = bundle.id ?? 0

        self.init("Stage/\(rawValue)", bundle: .module)
    }

    init(bundle: SpecialType) {
        let rawValue: Int = bundle.id ?? 0

        self.init("Special/\(rawValue)", bundle: .module)
    }

    init(bundle: IkuraType) {
        self.init("Ikura/\(bundle.rawValue)", bundle: .module)
    }

    init(bundle: StatusType) {
        self.init("Status/\(bundle.rawValue)", bundle: .module)
    }

    init(bundle: SakelienType) {
        let rawValue: Int = bundle.id ?? 0

        self.init("Sakelien/\(rawValue)", bundle: .module)
    }
}
