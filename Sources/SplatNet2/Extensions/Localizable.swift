//
//  Localizable.swift
//  Common
//
//  Created by tkgstrator on 2022/08/28.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

extension RawRepresentable where RawValue == String {
    /// 翻訳されたファイル
    public var localized: String {
        NSLocalizedString(rawValue, bundle: .module, comment: "")
    }
}
