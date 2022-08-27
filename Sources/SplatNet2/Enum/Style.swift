//
//  Style.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public enum Style: String, Codable, CaseIterable, Identifiable {
    case girl
    case boy
}

public extension Style {
    var id: String { rawValue }
}
