//
//  VsRuleType.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum VsRuleType: Int, CaseIterable, Codable {
    public var id: Int { rawValue }

    case TURF_WAR       = 0
    case SPLATZONES     = 1
    case TOWER_CONTROL  = 2
    case RAINMAKER      = 3
    case CLAM_BLITZ     = 4
}
