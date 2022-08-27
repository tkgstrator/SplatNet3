//
//  WaterId.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public enum WaterId: Int, Codable, CaseIterable, Identifiable {
    case low    = 0
    case normal = 1
    case high   = 2
}

public enum WaterKey: String, Codable, CaseIterable, Identifiable {
    case low
    case normal
    case high
}

public extension WaterKey {
    var id: String { rawValue }
}

public extension WaterId {
    var id: Int { rawValue }
}
