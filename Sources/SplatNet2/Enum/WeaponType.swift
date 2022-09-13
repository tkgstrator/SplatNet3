//
//  WeaponType.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public enum WeaponType: Int, Codable, CaseIterable, Identifiable {
    case randomGold                 = -2
    case randomGreen                = -1
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
    case shooterBlasterBurst        = 20_000
    case umbrellaAutoAssault        = 20_010
    case chargerSpark               = 20_020
    case slosherVase                = 20_030

    public enum Image: String, Codable, CaseIterable {
        case randomGold                 = "/images/coop_weapons/7076c8181ab5c49d2ac91e43a2d945a46a99c17d.png"
        case randomGreen                = "/images/coop_weapons/746f7e90bc151334f0bf0d2a1f0987e311b03736.png"
        case shooterShort               = "/images/weapon/32d41a5d14de756c3e5a1ee97a9bd8fcb9e69bf5.png"
        case shooterFirst               = "/images/weapon/91b6666bcbfccc204d86f21222a8db22a27d08d0.png"
        case shooterPrecision           = "/images/weapon/e5a97d52f12a83a037526588363021f2c1f718b0.png"
        case shooterBlaze               = "/images/weapon/c6ab7ebff7af7f7604eb53a12851da880b1ec2c7.png"
        case shooterNormal              = "/images/weapon/e1d09fc9502a81c82137c8dcd5a872eb872af697.png"
        case shooterGravity             = "/images/weapon/df04ddaf086cea94491df553a6d2550230a4da3c.png"
        case shooterQuickMiddle         = "/images/weapon/1f2b1db5917ef7a4e62f0e15b8805275e33f2179.png"
        case shooterExpert              = "/images/weapon/2e2b59379b8f14cfed0600f84590be0ecad707b6.png"
        case shooterHeavy               = "/images/weapon/df90f6065594378690647c23d42440e2de89c99d.png"
        case shooterLong                = "/images/weapon/007fb7ed50e76dde495ffb0747421b50dfce8aa3.png"
        case shooterBlasterShort        = "/images/weapon/3f840ce3cc5ac0b8cbf7451079b57e807d8b95f1.png"
        case shooterBlasterMiddle       = "/images/weapon/cfafc8bc42bcd89058fdb22b7b943fb9f893adb8.png"
        case shooterBlasterLong         = "/images/weapon/109b2b851481510eaacb50afc8ce9fb79b7f20ad.png"
        case shooterBlasterLightShort   = "/images/weapon/2b684d81508ca5286060767e29dd81ca38303f43.png"
        case shooterBlasterLight        = "/images/weapon/72bdcf5f6077bd7149832153034b3f43d16ac461.png"
        case shooterBlasterLightLong    = "/images/weapon/8f64580bb033ba86fa0179179cfeb56b5544fda6.png"
        case shooterTripleQuick         = "/images/weapon/202724be5bb5e59457227d087d7c48a32c01db24.png"
        case shooterTripleMiddle        = "/images/weapon/45e8847cbaf09bdc86c6e6627236286781b09f0f.png"
        case shooterFlash               = "/images/weapon/b9901d49ef3229d3e62d58fc3e1edc8c48da6873.png"
        case rollerCompact              = "/images/weapon/123db7c37066e10e2c437656db2a26f18898e6b6.png"
        case rollerNormal               = "/images/weapon/1041dbdd11b3036671148d47c2e0798cecf3dba2.png"
        case rollerHeavy                = "/images/weapon/3d274190988ad20dd1b02825448edbb6e12c720c.png"
        case rollerHunter               = "/images/weapon/e32ed68bb18628c5ede5816a2fbc2b8fcdd04124.png"
        case rollerBrushMini            = "/images/weapon/1f94c29067c918ac9143b756dc607ff0f8cf4e63.png"
        case rollerBrushNormal          = "/images/weapon/f1d5740dfb7d87f7e43974bbe5585445368741b8.png"
        case chargerQuick               = "/images/weapon/5a0a20324f1374a363363d721a605849e36ffff2.png"
        case chargerNormal              = "/images/weapon/1ed94885bef2b0e498ed4dd76bea9064c85cfc94.png"
        case chargerNormalScope         = "/images/weapon/0ec07bb00918f071975b35191e0860152bdcb321.png"
        case chargerLong                = "/images/weapon/a6279990ad871fccdd9f2a64a2951f8726f45c48.png"
        case chargerLongScope           = "/images/weapon/fd4b89e84b375f01290185f2236dbee935dd1682.png"
        case chargerLight               = "/images/weapon/6ecbbb897d6c59a5c03097216ef4f803366ea6fa.png"
        case chargerKeeper              = "/images/weapon/26d523e6eee3d57dc6c5f531dfc1747ffd46b8b8.png"
        case slosherStrong              = "/images/weapon/3963a3fb1ff8038a42072e913587fc6f9aa00d71.png"
        case slosherDiffusion           = "/images/weapon/ad921a57ab1b7721c50873c082bb34591b61021c.png"
        case slosherLauncher            = "/images/weapon/27a026e7dec5a068777bb7883f50451aec799d71.png"
        case slosherBathtub             = "/images/weapon/2835f6d61a4296b4ac3876337884a0c453a4fa4f.png"
        case slosherWashtub             = "/images/weapon/6f1c2a339db6ec0dccb65704adee2db93c768245.png"
        case spinnerQuick               = "/images/weapon/2a1c5ca0e68919b4d655bd860cac3b2942b95498.png"
        case spinnerStandard            = "/images/weapon/6f42c9f8fde07510a01072a669125545f6effb99.png"
        case spinnerHyper               = "/images/weapon/e34bbd580e49695b97d5fc4464cc901d4fe08ce5.png"
        case spinnerDownpour            = "/images/weapon/f208b6222acb5014ab96285e9b9a3e98039c884b.png"
        case spinnerSerein              = "/images/weapon/d79b99092aa03dc249b1f767197c1ecbda9d3cd7.png"
        case twinsShort                 = "/images/weapon/cc4bc30ff53bf2b45bd5e3dadceb39d52b95761f.png"
        case twinsNormal                = "/images/weapon/bb5caf24e43f8c7ceb126670bf24fd3aa9a3c3fc.png"
        case twinsGallon                = "/images/weapon/7d6032f0ceee14c4607385b848c6e486b84a2865.png"
        case twinsDual                  = "/images/weapon/aaead5ff0b63cdcb989b211d649b2552bb3e3a1b.png"
        case twinsStepper               = "/images/weapon/ba750d284eb067abdc995435c3358eed4e6f90fa.png"
        case umbrellaNormal             = "/images/weapon/f1fa6db2e21f32cd1c2cd093ec24f1a450d4650c.png"
        case umbrellaWide               = "/images/weapon/cdb032aa993f4836580ce4edac06de0138833299.png"
        case umbrellaCompact            = "/images/weapon/15fe3fe6bbec24ddb5fdc3ffd06585bc82440531.png"
        case shooterBlasterBurst        = "/images/weapon/db39203d81d60a7370d3ae966bc02ed14398366f.png"
        case umbrellaAutoAssault        = "/images/weapon/7d5ff3a57c3c3aaf28217bc3a79e02d665f13ba7.png"
        case chargerSpark               = "/images/weapon/95077fe72924bcd64f37cd43aa49a12cd6329a7e.png"
        case slosherVase                = "/images/weapon/c2c0653d3246ea6df2b595c68e907f68eda49b08.png"
    }

    public enum WeaponId: String, Codable, CaseIterable {
        case randomGold                 = "-2"
        case randomGreen                = "-1"
        case shooterShort               = "0"
        case shooterFirst               = "10"
        case shooterPrecision           = "20"
        case shooterBlaze               = "30"
        case shooterNormal              = "40"
        case shooterGravity             = "50"
        case shooterQuickMiddle         = "60"
        case shooterExpert              = "70"
        case shooterHeavy               = "80"
        case shooterLong                = "90"
        case shooterBlasterShort        = "200"
        case shooterBlasterMiddle       = "210"
        case shooterBlasterLong         = "220"
        case shooterBlasterLightShort   = "230"
        case shooterBlasterLight        = "240"
        case shooterBlasterLightLong    = "250"
        case shooterTripleQuick         = "300"
        case shooterTripleMiddle        = "310"
        case shooterFlash               = "400"
        case rollerCompact              = "1000"
        case rollerNormal               = "1010"
        case rollerHeavy                = "1020"
        case rollerHunter               = "1030"
        case rollerBrushMini            = "1100"
        case rollerBrushNormal          = "1110"
        case chargerQuick               = "2000"
        case chargerNormal              = "2010"
        case chargerNormalScope         = "2020"
        case chargerLong                = "2030"
        case chargerLongScope           = "2040"
        case chargerLight               = "2050"
        case chargerKeeper              = "2060"
        case slosherStrong              = "3000"
        case slosherDiffusion           = "3010"
        case slosherLauncher            = "3020"
        case slosherBathtub             = "3030"
        case slosherWashtub             = "3040"
        case spinnerQuick               = "4000"
        case spinnerStandard            = "4010"
        case spinnerHyper               = "4020"
        case spinnerDownpour            = "4030"
        case spinnerSerein              = "4040"
        case twinsShort                 = "5000"
        case twinsNormal                = "5010"
        case twinsGallon                = "5020"
        case twinsDual                  = "5030"
        case twinsStepper               = "5040"
        case umbrellaNormal             = "6000"
        case umbrellaWide               = "6010"
        case umbrellaCompact            = "6020"
        case shooterBlasterBurst        = "20000"
        case umbrellaAutoAssault        = "20010"
        case chargerSpark               = "20020"
        case slosherVase                = "20030"
    }
}

public extension WeaponType {
    var id: Int { rawValue }
}

public extension WeaponType.WeaponId {
    var id: String { rawValue }
}

public extension WeaponType.Image {
    var id: String { rawValue }
}
