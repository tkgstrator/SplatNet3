//
//  CoopSetting.swift
//  
//
//  Created by devonly on 2022/12/04.
//

import Foundation

public enum CoopSetting: String, CaseIterable, Codable, Identifiable {
    public var id: String { rawValue }
    
    case CoopBigRunSetting
    case CoopNormalSetting
}
