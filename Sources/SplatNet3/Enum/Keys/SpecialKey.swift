//
//  SpecialKey.swift
//  
//
//  Created by devonly on 2022/11/24.
//

import Foundation

public enum SpecialKey: String, CaseIterable, Identifiable, Codable {
    public var id: String { rawValue }
    case SpUltraShot        = "7269f1fa71d746d7b86ca2a71fc24c6ea4c764077ee50d692f80eddeaff90f1d"
    case SpShockSonar       = "463eedc60013608666b260c79ac8c352f9795c3d0cce074d3fbbdbd2c054a56d"
    case SpNiceBall         = "bd327d1b64372dedefd32adb28bea62a5b6152d93aada5d9fc4f669a1955d6d4"
    case SpJetpack          = "252059408283fbcb69ca9c18b98effd3b8653ab73b7349c42472281e5a1c38f9"
    case SpChariot          = "680379f8b83e5f9e033b828360827bc2f0e08c34df1abcc23de3d059fe2ac435"
    case SpSkewer           = "0785cb4979024a83aaa2196e287e232d5d7e4ac959895a650c30ed00fedbc714"
    case SpTripleTornado    = "380e541b5bc5e49d77ff1a616f1343aeba01d500fee36aaddf8f09d74bd3d3bc"
    case SpMicroLaser       = "fa8d49e8c850ee69f0231976208a913384e73dc0a39e6fb00806f6aa3da8a1ee"
}
