//
//  VsModeId.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum VsModeId: Int, CaseIterable, Identifiable, Codable {
    public var id: Int { rawValue }

    case REGULAR            = 1
    case BANKARA_CHALLENGE  = 2
    case PRIVATE            = 5
    case BANKARA_OPEN       = 51
}
