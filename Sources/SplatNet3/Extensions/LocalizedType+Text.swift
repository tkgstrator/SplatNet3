//
//  LocalizedType+Text.swift
//  
//
//  Created by devonly on 2022/12/14.
//

import Foundation

public extension LocalizedType {
    var localized: String {
        NSLocalizedString(self.rawValue, bundle: .module, comment: "")
    }
}
