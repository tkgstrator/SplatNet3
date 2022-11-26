//
//  CoopStageId.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum CoopStageId: Int, CaseIterable, Identifiable, Codable {
    public var id: Int { rawValue }

    case Unknown        = -1
    case Tutorial       = 0
    case ShakeUp        = 1
    case ShakeSpiral    = 2
    case ShakeShip      = 3
    case ShakeHouse     = 4
    case ShakeLift      = 5
    case ShakeRide      = 6
    case ShakeDent      = 7
}
