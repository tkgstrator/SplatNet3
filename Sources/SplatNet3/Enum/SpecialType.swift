//
//  SpecialType.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/08/13.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Foundation

public enum SpecialType: RawRepresentables {

}

public enum SpecialId: String, CaseIterable, Codable {
    case SpNiceBall    = 20006
    case SpShockSonar    = 20007
    case SpMicroLaser    = 20009
    case SpJetpack    = 20010
    case SpChariot    = 20012
    case SpSkewer    = 20013
    case SpTripleTornado    = 20014
}

public enum SpecialId: String, CaseIterable, Codable {
    case SpShockSonar       = "463eedc60013608666b260c79ac8c352f9795c3d0cce074d3fbbdbd2c054a56d"
    case SpNiceBall         = "bd327d1b64372dedefd32adb28bea62a5b6152d93aada5d9fc4f669a1955d6d4"
    case SpJetpack          = "252059408283fbcb69ca9c18b98effd3b8653ab73b7349c42472281e5a1c38f9"
    case SpChariot          = "680379f8b83e5f9e033b828360827bc2f0e08c34df1abcc23de3d059fe2ac435"
    case SpSkewer           = "0785cb4979024a83aaa2196e287e232d5d7e4ac959895a650c30ed00fedbc714"
    case SpTripleTornado    = "380e541b5bc5e49d77ff1a616f1343aeba01d500fee36aaddf8f09d74bd3d3bc"
    case SpMicroLaser       = "fa8d49e8c850ee69f0231976208a913384e73dc0a39e6fb00806f6aa3da8a1ee"
}
