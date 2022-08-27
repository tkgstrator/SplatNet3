//
//  Species.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public enum Species: String, Codable, CaseIterable, Identifiable {
    case inklings
    case octolings
}

public extension Species {
    var id: String { rawValue }
}
