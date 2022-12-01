//
//  GradeId.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum GradeId: Int, CaseIterable, Identifiable, Codable {
    public var id: Int { rawValue }

    case Apprentice         = 0
    case Part_Timer         = 1
    case Go_Getter          = 2
    case Overachiever       = 3
    case Profreshional      = 4
    case Profreshional_1    = 5
    case Profreshional_2    = 6
    case Profreshional_3    = 7
    case Eggsecutive_VP     = 8
}
