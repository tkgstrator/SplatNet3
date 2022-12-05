//
//  SpeciesType.swift
//  
//
//  Created by devonly on 2022/11/24.
//

import Foundation

public enum SpeciesType: String, CaseIterable, Identifiable, Codable {
    public var id: String { rawValue }

    case UNKNOWN
    case INKLING
    case OCTOLING
}
