//
//  ProgressType.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import SwiftUI

public enum ProgressType: Int, CaseIterable {
    case PROGRESS   = 0
    case SUCCESS    = 1
    case FAILURE    = 2
}

public enum ProgressAPIType: String, CaseIterable {
    case NSO    = "NSO"
    case APP    = "APP"
    case API    = "API"
    case IMINK  = "IMINK"
    case FLAPG  = "FLAPG"
    case NXAPI  = "NXAPI"
}
