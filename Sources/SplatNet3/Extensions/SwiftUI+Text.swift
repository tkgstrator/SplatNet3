//
//  SwiftUI+Text.swift
//  
//
//  Created by devonly on 2022/10/03.
//


import Foundation
import SwiftUI

public extension Text {
    init(bundle: LocalizedText) {
        self.init(NSLocalizedString(bundle.rawValue, bundle: .module, comment: ""))
    }
}
