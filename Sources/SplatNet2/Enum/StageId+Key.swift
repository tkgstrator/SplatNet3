//
//  StageId.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public enum StageId: Int, Codable, CaseIterable, Identifiable {
    case shakeup    = 5_000
    case shakeship  = 5_001
    case shakehouse = 5_002
    case shakelift  = 5_003
    case shakeride  = 5_004
}

public enum StageKey: String, Codable, CaseIterable, Identifiable {
    case shakeup    = "/images/coop_stage/65c68c6f0641cc5654434b78a6f10b0ad32ccdee.png"
    case shakeship  = "/images/coop_stage/e07d73b7d9f0c64e552b34a2e6c29b8564c63388.png"
    case shakehouse = "/images/coop_stage/6d68f5baa75f3a94e5e9bfb89b82e7377e3ecd2c.png"
    case shakelift  = "/images/coop_stage/e9f7c7b35e6d46778cd3cbc0d89bd7e1bc3be493.png"
    case shakeride  = "/images/coop_stage/50064ec6e97aac91e70df5fc2cfecf61ad8615fd.png"
}

public extension StageKey {
    var id: String { rawValue }
}

public extension StageId {
    var id: Int { rawValue }
}
