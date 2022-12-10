//
//  ModeType.swift
//  
//
//  Created by devonly on 2022/11/24.
//

import Foundation

public enum ModeType: String, CaseIterable, Codable {
    public var id: String { rawValue }

    case UNKNOWN
    case REGULAR
    case PRIVATE_CUSTOM
    case PRIVATE_SCENARIO
}
