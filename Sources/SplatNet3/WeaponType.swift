//
//  WeaponType.swift
//  
//
//  Created by devonly on 2022/08/25.
//  Copyright © 2022 Magi Corporation. All rights reserved.
//

import Foundation
import SwiftUI

public enum WeaponType: Int, CaseIterable {
    public enum Package {
        public static let namespace = "Weapons"
        public static let version = "1.0.0"
    }

    public var symbolName: String {
        "\(Package.namespace)/\(rawValue)"
    }

    case shooterShort               = 0
    case shooterFirst               = 10
    case shooterPrecision           = 20
    case shooterBlaze               = 30
    case shooterNormal              = 40
    case shooterGravity             = 50
    case shooterQuickMiddle         = 60
    case shooterExpert              = 70
    case shooterHeavy               = 80
    case shooterLong                = 90
    case shooterBlasterShort        = 200
    case shooterBlasterMiddle       = 210
    case shooterBlasterLong         = 220
    case shooterBlasterLightShort   = 230
    case shooterBlasterLight        = 240
    case shooterBlasterLightLong    = 250
    case shooterTripleQuick         = 300
    case shooterTripleMiddle        = 310
    case shooterFlash               = 400
    case rollerCompact              = 1_000
    case rollerNormal               = 1_010
    case rollerHeavy                = 1_020
    case rollerHunter               = 1_030
    case rollerBrushMini            = 1_100
    case rollerBrushNormal          = 1_110
    case chargerQuick               = 2_000
    case chargerNormal              = 2_010
    case chargerNormalScope         = 2_020
    case chargerLong                = 2_030
    case chargerLongScope           = 2_040
    case chargerLight               = 2_050
    case chargerKeeper              = 2_060
    case slosherStrong              = 3_000
    case slosherDiffusion           = 3_010
    case slosherLauncher            = 3_020
    case slosherBathtub             = 3_030
    case slosherWashtub             = 3_040
    case spinnerQuick               = 4_000
    case spinnerStandard            = 4_010
    case spinnerHyper               = 4_020
    case spinnerDownpour            = 4_030
    case spinnerSerein              = 4_040
    case twinsShort                 = 5_000
    case twinsNormal                = 5_010
    case twinsGallon                = 5_020
    case twinsDual                  = 5_030
    case twinsStepper               = 5_040
    case umbrellaNormal             = 6_000
    case umbrellaWide               = 6_010
    case umbrellaCompact            = 6_020
}

extension WeaponType: Identifiable {
    public var id: Int { rawValue }
}

extension Image {
    public init(weaponType: WeaponType) {
        self.init(weaponType.symbolName, bundle: .module)
    }

    public init(weaponId: Int) {
        self.init((WeaponType(rawValue: weaponId) ?? .shooterShort).symbolName, bundle: .module)
    }
}

