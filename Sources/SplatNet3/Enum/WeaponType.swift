//
//  WeaponType.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/08/13.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Foundation

@dynamicMemberLookup
public enum WeaponType: Codable, CaseIterable {

    public var localizedText: String {
        NSLocalizedString(self.sha256Hash ?? "Unknown Value", bundle: .module, comment: "")
    }

    case Random_Gold
    case Random_Green
    case Shooter_Short
    case Shooter_First
    case Shooter_Precision
    case Shooter_Blaze
    case Shooter_Normal
    case Shooter_Gravity
    case Shooter_QuickMiddle
    case Shooter_Expert
    case Shooter_Heavy
    case Shooter_Long
    case Blaster_Short
    case Blaster_Middle
    case Blaster_Long
    case Blaster_LightShort
    case Blaster_Light
    case Blaster_LightLong
    case Shooter_TripleQuick
    case Shooter_TripleMiddle
    case Shooter_Flash
    case Roller_Compact
    case Roller_Normal
    case Roller_Heavy
    case Roller_Hunter
    case Brush_Mini
    case Brush_Normal
    case Charger_Quick
    case Charger_Normal
//    case Charger_NormalScope
    case Charger_Long
//    case Charger_LongScope
    case Charger_Light
    case Charger_Keeper
    case Slosher_Strong
    case Slosher_Diffusion
    case Slosher_Launcher
    case Slosher_Bathtub
    case Slosher_Washtub
    case Spinner_Quick
    case Spinner_Standard
    case Spinner_Hyper
    case Spinner_Downpour
    case Spinner_Serein
    case Maneuver_Short
    case Maneuver_Normal
    case Maneuver_Gallon
    case Maneuver_Dual
    case Maneuver_Stepper
    case Shelter_Normal
    case Shelter_Wide
    case Shelter_Compact
    case Stringer_Normal
    case Stringer_Short
    case Saber_Normal
    case Saber_Lite
    case Blaster_Bear_Coop
    case Charger_Bear_Coop
    case Shelter_Bear_Coop
    case Slosher_Bear_Coop
    case Stringer_Bear_Coop

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        let baseURL: URL = URL(unsafeString: try container.decode(String.self))
        let lastPathComponent: String = baseURL.lastPathComponent
        let sha256Hash: String = String(lastPathComponent.dropLast(6))

        self.init(hash: sha256Hash)!
    }
}

public enum WeaponId: Int, Codable, CaseIterable {
    /// 金ランダム
    case Random_Gold            = -2
    /// 緑ランダム
    case Random_Green           = -1
    /// ボールドマーカー
    case Shooter_Short          = 0
    /// わかばシューター
    case Shooter_First          = 10
    /// シャープマーカー
    case Shooter_Precision      = 20
    /// プロモデラー
    case Shooter_Blaze          = 30
    /// スプラシューター
    case Shooter_Normal         = 40
    case Shooter_Gravity        = 50
    case Shooter_QuickMiddle    = 60
    /// プライムシューター
    case Shooter_Expert         = 70
    case Shooter_Heavy          = 80
    case Shooter_Long           = 90
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
    case Brush_Mini             = 1100
    case Brush_Normal           = 1110
    case Charger_Quick          = 2000
    case Charger_Normal         = 2010
//    case Charger_NormalScope    = 2020
    case Charger_Long           = 2030
//    case Charger_LongScope      = 2040
    case Charger_Light          = 2050
    case Charger_Keeper         = 2060
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
    case Shelter_Bear_Coop      = 26900
    case Slosher_Bear_Coop      = 23900
    case Stringer_Bear_Coop     = 27900
}

public enum WeaponKey: String, Codable, CaseIterable {
    case Random_Gold            = ""
    case Random_Green           = "473fffb2442075078d8bb7125744905abdeae651b6a5b7453ae295582e45f7d1"
    case Shooter_Short          = "6e58a0747ab899badcb6f351512c6034e0a49bd6453281f32c7f550a2132fd65"
    case Shooter_First          = "8e134a80cd54f4235329493afd43ff754b367a65e460facfcca862b174754b0e"
    case Shooter_Precision      = "25e98eaba1e17308db191b740d9b89e6a977bfcd37c8dc1d65883731c0c72609"
    case Shooter_Blaze          = "5ec00bcf96c7a3f731d7a2e67f60f802f33d22f07177b94d5905f471b08b629f"
    case Shooter_Normal         = "e3874d7d504acf89488ad7f68d29a348caea1a41cd43bd9a272069b0c0466570"
    case Shooter_Gravity        = "01e8399a3c56707b6e9f7500d3d583ba1d400eec06449d8fe047cda1956a4ccc"
    case Shooter_QuickMiddle    = "e6dbf73aa6ff9d1feb61fcabadb2d31e08b228a9736b4f5d8a5baeab9b493255"
    case Shooter_Expert         = "5607f7014bbc7339feeb67218c05ef19c7a466152b1bd056a899b955127ea433"
    case Shooter_Heavy          = "fe2b351799aa48fcb48154299ff0ccf0b0413fc291ffc49456e93db29d2f1db5"
    case Shooter_Long           = "035920eb9428955c25aecb8a56c2b1b58f3e322af3657d921db1778de4b80c59"
    case Blaster_Short          = "10d4a1584d1428cb164ddfbc5febc9b1e77fd05e2e9ed9de851838a94d202c15"
    case Blaster_Middle         = "29ccca01285a04f42dc15911f3cd1ee940f9ca0e94c75ba07378828afb3165c0"
    case Blaster_Long           = "0d2963b386b6da598b8da1087eab3f48b99256e2e6a20fc8bbe53b34579fb338"
    case Blaster_LightShort     = "be8ba95bd3017a83876e7f769ee37ee459ee4b2d6eca03fceeb058c510adbb61"
    case Blaster_Light          = "0a929d514403d07e1543e638141ebace947ffd539f5f766b42f4d6577d40d7b8"
    case Blaster_LightLong      = "954a5ea059f841fa5f1cd2596bb32f23b3d3b03fc3fa7972077bdbafe6051215"
    case Shooter_TripleQuick    = "96833fc0f74242cd2bc73b241aab8a00d499ce9f6557722ef6503e12af8979f4"
    case Shooter_TripleMiddle   = "418d75d9ca0304922f06eff539c511238b143ef8331969e20d54a9560df57d5a"
    case Shooter_Flash          = "db9f2ff8fab9f74c05c7589d43f132eacbff94154dcc20e09c864fced36d4d95"
    case Roller_Compact         = "29358fd25b6ad1ba9e99f5721f0248af8bde7f1f757d00cbbc7a8a6be02a880d"
    case Roller_Normal          = "536b28d9dd9fc6633a4bea4a141d63942a0ba3470fc504e5b0d02ee408798a87"
    case Roller_Heavy           = "18fdddee9c918842f076c10f12e46d891aca302d2677bf968ee2fe4e65b831a8"
    case Roller_Hunter          = "8351e99589f03f49b5d681d36b083aaffd9c486a0558ab957ac44b0db0bb58bb"
    case Brush_Mini             = "260428edbf919f5c9e8c8517516d6a7a8133cf7348d216768ab4fb9434053f08"
    case Brush_Normal           = "ce0bb38588e497586a60f16e0aca914f181f42be29953742fd4a55a97e2ebd22"
    case Charger_Quick          = "0cdd6036a6677d68bf28e1014b09a6f5a043e969027e532cd008049baace6527"
    case Charger_Normal         = "3f99800b569e286305669b7ab28dc3ff0f0b1b015600569d5ac30ab8a97047a0"
//    case Charger_NormalScope    = "f6354a66c47ec15517bb457e3c48c97c3ff62d34ff38879dbb3e1665dea1be5a"
    case Charger_Long           = "ed294b2c7b3111988d577d7efddb9e5e475efc5e0932e5416efedc41fd98eb04"
//    case Charger_LongScope      = "ebc007b2f27b0813f0c9ce7371bdab78c62e6a05777c928bf34222a79d99de8f"
    case Charger_Light          = "9c71334ea792864a00531040e0d05a183512e11277fd1fa681170874ba039268"
    case Charger_Keeper         = "2b349390a464710982d7e1496130898e7b5a66c301aa44fc9e19332d42e360ad"
    case Slosher_Strong         = "4a8bf6b4ad3b2942728bbd270bf64d5848b64f3c843a3b12ef83c0ebb5de1b3d"
    case Slosher_Diffusion      = "f3dbd98d5b0e89f7be7eff25a5c63a06045fe64d8ffd5886e79c855e16791563"
    case Slosher_Launcher       = "bd2eca9a7b4109c1d96e804c74aaf2ca525011e1348d0b312fe4f034e35e5d4c"
    case Slosher_Bathtub        = "0199e455872acba1ab8ef0040eca7f41afca48c1f9ad2c5d274323d6dbc49133"
    case Slosher_Washtub        = "1e32f5e1e65793585f6423e4fcae1a146a79d2a09e6e15575015af8a2032a4fe"
    case Spinner_Quick          = "32dbc48e000d5d2015468e1dafc05e7c24581a73e54e758af0c8b9e2db3db550"
    case Spinner_Standard       = "fd06f01742a3b25ac57941150b3b81d56633831902f2da1f19a6244f2d8dd6fd"
    case Spinner_Hyper          = "34fe0401b6f6a0b09839696fc820ece9570a9d56e3a746b65f0604dec91a9920"
    case Spinner_Downpour       = "206dbf3b5dfc9962b6a783acf68a856f0c8fbf0c56257c2ca5c25d63198dd6e1"
    case Spinner_Serein         = "be4316928f4b031b470ec2cc2c48fb922a303c882802e32d7fa802249edaa212"
    case Maneuver_Short         = "f1c8fc32bd90fc9258dc17e9f9bcfd5e6498f6e283709bf1896b78193b8e39e9"
    case Maneuver_Normal        = "b43978029ea582de3aca34549cafd810df20082b94104634093392e11e30d9bd"
    case Maneuver_Gallon        = "802d3d501738c620b4f709203ccad343490bd3340b2fda21eb38a362320dc6ed"
    case Maneuver_Dual          = "b8f50833f99b0db251dc1812e5d13df09b393635b9b6bd684525112cbb38e5e4"
    case Maneuver_Stepper       = "e68609e51d30dfb13e1ea996e46995ed1f7cf561caef0fe96314966d0a039109"
    case Shelter_Normal         = "15d101d0d11acbb8159e2701282879f2617d90c8573fd2f2239807721ff54ca4"
    case Shelter_Wide           = "a7b1903741696c0ebeda76c9e16fa0a81ae4e37f5331ad6282fc2be1ae1c1c59"
    case Shelter_Compact        = "7508ba286e5ac5befe63daea807ab54996c3f0ef3577be9ab5d2827c49dedd75"
    case Stringer_Normal        = "676d9f49276f171a93ac06646c0fbdfbeb8c3d0284a057aee306404a6034ffef"
    case Stringer_Short         = "9baac6cc774d0e6f2ac8f6e217d700e6f1f47320130598c5f1e922210ccdcc89"
    case Saber_Normal           = "ddd2a4258a70cdaf8a1dbc0ded024db497445d71f950fe7645fa8c69a178a082"
    case Saber_Lite             = "3aa72d418643038a9e3248af734b0d6a0bf3d3bf9793d75912b1b959f93c2258"
    case Blaster_Bear_Coop      = "0962405d6aecff4a075c46e895c42984e33b26c4b2b4b25c5058366db3c35ba4"
    case Charger_Bear_Coop      = "5cc158250a207241f51d767a47bbb6139fe1c4fb652cc182b73aac93baa659c5"
    case Shelter_Bear_Coop      = "3380019464e3111a0f40e633be25f73ad34ec1844d2dc7852a349b29b238932b"
    case Slosher_Bear_Coop      = "bf89bcf3d3a51badd78b436266e6b7927d99ac386e083023df3551da6b39e412"
    case Stringer_Bear_Coop     = "36e03d8d1e6bc4f7449c5450f4410c6c8449cde0548797d22ab641cd488d2060"
}

public extension WeaponType {
    /// ブキIDで初期化
    init?(id: Int) {
        self.init(WeaponId(rawValue: id))
    }

    /// SHA256Hashで初期化
    init?(hash: String) {
        self.init(WeaponKey(rawValue: hash))
    }

    subscript<V>(dynamicMember keyPath: KeyPath<WeaponId, V>) -> V? {
      self[keyPath]
    }

    subscript<V>(dynamicMember keyPath: KeyPath<WeaponKey, V>) -> V? {
      self[keyPath]
    }

    private init?<T>(_ object: T?) where T: CaseIterable, T.AllCases.Index == AllCases.Index, T: Equatable {
      switch object {
      case let object? where object.offset < Self.allCases.endIndex:
        self = Self.allCases[object.offset]

      case _:
        return nil
      }
    }

    private subscript<T, V>(_ keyPath: KeyPath<T, V>) -> V? where T: CaseIterable, T.AllCases.Index == AllCases.Index {
      (offset < T.allCases.endIndex) ? T.allCases[offset][keyPath: keyPath] : nil
    }
}

extension WeaponId {
    /// ブキID
    public var id: Int { rawValue }
}

extension WeaponKey {
    /// ブキKey
    public var sha256Hash: String { rawValue }
}
