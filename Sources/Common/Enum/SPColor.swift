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
}
