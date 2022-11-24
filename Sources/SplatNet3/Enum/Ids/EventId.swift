//
//  EventId.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum EventId: Int, Identifiable, CaseIterable, Codable {
    public var id: Int { rawValue }

    case Water_Levels
    case Rush
    case Goldie_Seeking
    case Griller
    case The_Mothership
    case Fog
    case Cohock_Charge
    case Giant
    case Mudmouth
}
