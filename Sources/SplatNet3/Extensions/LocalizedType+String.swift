//
//  LocalizedType+String.swift
//  
//
//  Created by devonly on 2022/11/27.
//

import Foundation

public extension String {
    init(_ bundle: LocalizedType) {
        self = NSLocalizedString(bundle.rawValue, bundle: .module, comment: "")
    }
}
