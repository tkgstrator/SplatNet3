//
//  SpecialId.swift
//  
//
//  Created by devonly on 2022/11/24.
//

import Foundation

public enum SpecialId: Int, CaseIterable, Identifiable, Codable {
    public var id: Int { rawValue }

    case SpUltraShot        = 0
    case SpNiceBall         = 20006
    case SpShockSonar       = 20007
    case SpMicroLaser       = 20009
    case SpJetpack          = 20010
    case SpChariot          = 20012
    case SpSkewer           = 20013
    case SpTripleTornado    = 20014

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let intValue: Int = try container.decode(Int.self)
        self = Self(rawValue: intValue) ?? .SpUltraShot
    }
}
