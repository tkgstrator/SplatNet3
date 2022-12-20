//
//  WeaponId.swift
//  
//
//  Created by devonly on 2022/11/26.
//

import Foundation

public enum WeaponId: Int, Codable, Identifiable, CaseIterable {
    public var id: Int { rawValue }
    case Random_Gold            = -2
    case Random_Green           = -1
    case Shooter_Short          = 0
    case Shooter_First          = 10
    case Shooter_Precision      = 20
    case Shooter_Blaze          = 30
    case Shooter_Normal         = 40
    case Shooter_Gravity        = 50
    case Shooter_QuickMiddle    = 60
    case Shooter_Expert         = 70
    case Shooter_Heavy          = 80
    case Shooter_Long           = 90
    case Shooter_QuickLong      = 100
    case Blaster_Short          = 200
    case Blaster_Middle         = 210
    case Blaster_Long           = 220
    case Blaster_LightShort     = 230
    case Blaster_Light          = 240
    case Blaster_LightLong      = 250
    case Shooter_TripleQuick    = 300
    case Shooter_TripleMiddle   = 310
    case Shooter_Flash          = 400
    case Roller_Compact         = 1000
    case Roller_Normal          = 1010
    case Roller_Heavy           = 1020
    case Roller_Hunter          = 1030
    case Roller_Wide            = 1040
    case Brush_Mini             = 1100
    case Brush_Normal           = 1110
    case Charger_Quick          = 2000
    case Charger_Normal         = 2010
    case Charger_Long           = 2030
    case Charger_Light          = 2050
    case Charger_Keeper         = 2060
    case Charger_Pencil         = 2070
    case Slosher_Strong         = 3000
    case Slosher_Diffusion      = 3010
    case Slosher_Launcher       = 3020
    case Slosher_Bathtub        = 3030
    case Slosher_Washtub        = 3040
    case Spinner_Quick          = 4000
    case Spinner_Standard       = 4010
    case Spinner_Hyper          = 4020
    case Spinner_Downpour       = 4030
    case Spinner_Serein         = 4040
    case Maneuver_Short         = 5000
    case Maneuver_Normal        = 5010
    case Maneuver_Gallon        = 5020
    case Maneuver_Dual          = 5030
    case Maneuver_Stepper       = 5040
    case Shelter_Normal         = 6000
    case Shelter_Wide           = 6010
    case Shelter_Compact        = 6020
    case Stringer_Normal        = 7010
    case Stringer_Short         = 7020
    case Saber_Normal           = 8000
    case Saber_Lite             = 8010
    case Blaster_Bear_Coop      = 20900
    case Charger_Bear_Coop      = 22900
    case Slosher_Bear_Coop      = 23900
    case Shelter_Bear_Coop      = 26900
    case Stringer_Bear_Coop     = 27900
    case Saber_Bear_Coop        = 28900
}
