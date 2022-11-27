//
//  SwiftUI+Text.swift
//  
//
//  Created by devonly on 2022/11/27.
//

import Foundation
import SwiftUI

public extension Text {
    init(bundle: LocalizedType) {
        self.init(NSLocalizedString(bundle.rawValue, bundle: .module, comment: ""))
    }
}
