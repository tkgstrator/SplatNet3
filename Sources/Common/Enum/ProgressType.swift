//
//  ProgressType.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import SwiftUI

enum ProgressType: Int, CaseIterable {
    case PROGRESS   = 0
    case SUCCESS    = 1
    case FAILURE    = 2
}

enum ProgressAPIType: String, CaseIterable {
    case NSO    = "NSO"
    case APP    = "APP"
    case API    = "API"
    case IMINK  = "IMINK"
}
