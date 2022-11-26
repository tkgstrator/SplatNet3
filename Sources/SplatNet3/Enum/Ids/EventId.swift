//
//  EventId.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum EventId: Int, Identifiable, CaseIterable, Codable {
    public var id: Int { rawValue }

    case Water_Levels   = 0
    case Rush           = 1
    case Goldie_Seeking = 2
    case Griller        = 3
    case The_Mothership = 4
    case Fog            = 5
    case Cohock_Charge  = 6
    case Giant          = 7
    case Mudmouth       = 8
}
