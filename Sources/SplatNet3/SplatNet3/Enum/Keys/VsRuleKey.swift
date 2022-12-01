//
//  VsRuleKey.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum VsRuleKey: String, Codable, Identifiable, CaseIterable {
    public var id: String { rawValue }
    case TURF_WAR       = "TURF_WAR"
    case SPLATZONES     = "AREA"
    case TOWER_CONTROL  = "LOFT"
    case RAINMAKER      = "GOAL"
    case CLAM_BLITZ     = "CLAM"
}
