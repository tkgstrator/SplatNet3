//
//  SPColor.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/08/13.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Foundation
import SwiftUI

/// スプラトゥーンで実際に利用されるカラーコードをSwiftUIで再現したもの
public enum SPColor {
    public enum SplatNet2 {
        public static let SPBackground: Color           = Color("Color/SplatNet2/SPBackground", bundle: .module)
        public static let SPGreen: Color                = Color("Color/SplatNet2/SPGreen", bundle: .module)
        public static let SPOrange: Color               = Color("Color/SplatNet2/SPOrange", bundle: .module)
        public static let SPWhite: Color                = Color("Color/SplatNet2/SPWhite", bundle: .module)
        public static let SPYellow: Color               = Color("Color/SplatNet2/SPYellow", bundle: .module)
        public static let SPRed: Color                  = Color("Color/SplatNet2/SPRed", bundle: .module)
    }

    public enum SplatNet3 {
        public static let SPBackground: Color           = Color("Color/SplatNet3/SPBackground", bundle: .module)
        public static let SPBankara: Color              = Color("Color/SplatNet3/SPBankara", bundle: .module)
        public static let SPBlue: Color                 = Color("Color/SplatNet3/SPBlue", bundle: .module)
        public static let SPCoop: Color                 = Color("Color/SplatNet3/SPCoop", bundle: .module)
        public static let SPGesotown: Color             = Color("Color/SplatNet3/SPGesotown", bundle: .module)
        public static let SPGreen: Color                = Color("Color/SplatNet3/SPGreen", bundle: .module)
        public static let SPHero: Color                 = Color("Color/SplatNet3/SPHero", bundle: .module)
        public static let SPLeague: Color               = Color("Color/SplatNet3/SPLeague", bundle: .module)
        public static let SPOrange: Color               = Color("Color/SplatNet3/SPOrange", bundle: .module)
        public static let SPPink: Color                 = Color("Color/SplatNet3/SPPink", bundle: .module)
        public static let SPPrivate: Color              = Color("Color/SplatNet3/SPPrivate", bundle: .module)
        public static let SPPurple: Color               = Color("Color/SplatNet3/SPPurple", bundle: .module)
        public static let SPRed: Color                  = Color("Color/SplatNet3/SPRed", bundle: .module)
        public static let SPSalmonGreen: Color          = Color("Color/SplatNet3/SPSalmonGreen", bundle: .module)
        public static let SPSalmonOrange: Color         = Color("Color/SplatNet3/SPSalmonOrange", bundle: .module)
        public static let SPSalmonOrangeDarker: Color   = Color("Color/SplatNet3/SPSalmonOrangeDarker", bundle: .module)
        public static let SPXMatch: Color               = Color("Color/SplatNet3/SPXMatch", bundle: .module)
        public static let SPYellow: Color               = Color("Color/SplatNet3/SPYellow", bundle: .module)
    }

    public enum Theme {
        public static let SPTheme: Color        = Color("Color/Theme/SPTheme", bundle: .module)
        public static let SPDark: Color         = Color("Color/Theme/SPDark", bundle: .module)
        public static let SPOrange: Color       = Color("Color/Theme/SPOrange", bundle: .module)
        public static let SPYellow: Color       = Color("Color/Theme/SPYellow", bundle: .module)
        public static let SPRed: Color          = Color("Color/Theme/SPRed", bundle: .module)
        public static let SPBlue: Color         = Color("Color/Theme/SPBlue", bundle: .module)
        public static let SPPink: Color         = Color("Color/Theme/SPPink", bundle: .module)
        public static let SPGreen: Color        = Color("Color/Theme/SPGreen", bundle: .module)
    }

    public enum Blitz {
        public static let AlphaTeamColor: Color    = Color("Color/Blitz/AlphaTeamColor", bundle: .module)
        public static let AlphaUIColor: Color      = Color("Color/Blitz/AlphaUIColor", bundle: .module)
        public static let BravoTeamColor: Color    = Color("Color/Blitz/BravoTeamColor", bundle: .module)
        public static let BravoUIColor: Color      = Color("Color/Blitz/BravoUIColor", bundle: .module)
        public static let CharlieTeamColor: Color  = Color("Color/Blitz/CharlieTeamColor", bundle: .module)
        public static let CharlieUIColor: Color    = Color("Color/Blitz/CharlieUIColor", bundle: .module)
    }

    public enum Coop {
        public static let AlphaTeamColor: Color    = Color("Color/Coop/AlphaTeamColor", bundle: .module)
        public static let AlphaUIColor: Color      = Color("Color/Coop/AlphaUIColor", bundle: .module)
        public static let BravoTeamColor: Color    = Color("Color/Coop/BravoTeamColor", bundle: .module)
        public static let BravoUIColor: Color      = Color("Color/Coop/BravoUIColor", bundle: .module)
        public static let CharlieTeamColor: Color  = Color("Color/Coop/CharlieTeamColor", bundle: .module)
        public static let CharlieUIColor: Color    = Color("Color/Coop/CharlieUIColor", bundle: .module)
    }

    public enum CoopOption {
        public static let AlphaTeamColor: Color    = Color("Color/CoopOption/AlphaTeamColor", bundle: .module)
        public static let AlphaUIColor: Color      = Color("Color/CoopOption/AlphaUIColor", bundle: .module)
        public static let BravoTeamColor: Color    = Color("Color/CoopOption/BravoTeamColor", bundle: .module)
        public static let BravoUIColor: Color      = Color("Color/CoopOption/BravoUIColor", bundle: .module)
        public static let CharlieTeamColor: Color  = Color("Color/CoopOption/CharlieTeamColor", bundle: .module)
        public static let CharlieUIColor: Color    = Color("Color/CoopOption/CharlieUIColor", bundle: .module)
    }

    public enum Gambit {
        public static let AlphaTeamColor: Color    = Color("Color/Gambit/AlphaTeamColor", bundle: .module)
        public static let AlphaUIColor: Color      = Color("Color/Gambit/AlphaUIColor", bundle: .module)
        public static let BravoTeamColor: Color    = Color("Color/Gambit/BravoTeamColor", bundle: .module)
        public static let BravoUIColor: Color      = Color("Color/Gambit/BravoUIColor", bundle: .module)
        public static let CharlieTeamColor: Color  = Color("Color/Gambit/CharlieTeamColor", bundle: .module)
        public static let CharlieUIColor: Color    = Color("Color/Gambit/CharlieUIColor", bundle: .module)
    }

    public enum Mission {
        public static let AlphaTeamColor: Color    = Color("Color/Mission/AlphaTeamColor", bundle: .module)
        public static let AlphaUIColor: Color      = Color("Color/Mission/AlphaUIColor", bundle: .module)
        public static let BravoTeamColor: Color    = Color("Color/Mission/BravoTeamColor", bundle: .module)
        public static let BravoUIColor: Color      = Color("Color/Mission/BravoUIColor", bundle: .module)
        public static let CharlieTeamColor: Color  = Color("Color/Mission/CharlieTeamColor", bundle: .module)
        public static let CharlieUIColor: Color    = Color("Color/Mission/CharlieUIColor", bundle: .module)
    }

    public enum MissionOption {
        public static let AlphaTeamColor: Color    = Color("Color/MissionOption/AlphaTeamColor", bundle: .module)
        public static let AlphaUIColor: Color      = Color("Color/MissionOption/AlphaUIColor", bundle: .module)
        public static let BravoTeamColor: Color    = Color("Color/MissionOption/BravoTeamColor", bundle: .module)
        public static let BravoUIColor: Color      = Color("Color/MissionOption/BravoUIColor", bundle: .module)
        public static let CharlieTeamColor: Color  = Color("Color/MissionOption/CharlieTeamColor", bundle: .module)
        public static let CharlieUIColor: Color    = Color("Color/MissionOption/CharlieUIColor", bundle: .module)
    }

    public enum VersusOption {
        public static let AlphaTeamColor: Color    = Color("Color/VersusOption/AlphaTeamColor", bundle: .module)
        public static let AlphaUIColor: Color      = Color("Color/VersusOption/AlphaUIColor", bundle: .module)
        public static let BravoTeamColor: Color    = Color("Color/VersusOption/BravoTeamColor", bundle: .module)
        public static let BravoUIColor: Color      = Color("Color/VersusOption/BravoUIColor", bundle: .module)
        public static let CharlieTeamColor: Color  = Color("Color/VersusOption/CharlieTeamColor", bundle: .module)
        public static let CharlieUIColor: Color    = Color("Color/VersusOption/CharlieUIColor", bundle: .module)
    }

    public enum VersusRegular {
        public static let AlphaTeamColor: Color    = Color("Color/VersusRegular/AlphaTeamColor", bundle: .module)
        public static let AlphaUIColor: Color      = Color("Color/VersusRegular/AlphaUIColor", bundle: .module)
        public static let BravoTeamColor: Color    = Color("Color/VersusRegular/BravoTeamColor", bundle: .module)
        public static let BravoUIColor: Color      = Color("Color/VersusRegular/BravoUIColor", bundle: .module)
        public static let CharlieTeamColor: Color  = Color("Color/VersusRegular/CharlieTeamColor", bundle: .module)
        public static let CharlieUIColor: Color    = Color("Color/VersusRegular/CharlieUIColor", bundle: .module)
    }

    public enum VersusTricolor {
        public static let AlphaTeamColor: Color    = Color("Color/VersusTricolor/AlphaTeamColor", bundle: .module)
        public static let AlphaUIColor: Color      = Color("Color/VersusTricolor/AlphaUIColor", bundle: .module)
        public static let BravoTeamColor: Color    = Color("Color/VersusTricolor/BravoTeamColor", bundle: .module)
        public static let BravoUIColor: Color      = Color("Color/VersusTricolor/BravoUIColor", bundle: .module)
        public static let CharlieTeamColor: Color  = Color("Color/VersusTricolor/CharlieTeamColor", bundle: .module)
        public static let CharlieUIColor: Color    = Color("Color/VersusTricolor/CharlieUIColor", bundle: .module)
    }

    public enum VersisuTricolorOption {
        public static let AlphaTeamColor: Color    = Color("Color/VersusTricolorOption/AlphaTeamColor", bundle: .module)
        public static let AlphaUIColor: Color      = Color("Color/VersusTricolorOption/AlphaUIColor", bundle: .module)
        public static let BravoTeamColor: Color    = Color("Color/VersusTricolorOption/BravoTeamColor", bundle: .module)
        public static let BravoUIColor: Color      = Color("Color/VersusTricolorOption/BravoUIColor", bundle: .module)
        public static let CharlieTeamColor: Color  = Color("Color/VersusTricolorOption/CharlieTeamColor", bundle: .module)
        public static let CharlieUIColor: Color    = Color("Color/VersusTricolorOption/CharlieUIColor", bundle: .module)
    }
}
