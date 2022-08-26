//
//  Keychain.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/05/01.
//  Copyright © 2021 Magi, Corporation. All rights reserved.

import Foundation
import KeychainAccess

public extension Keychain {
    /// X-ProductVersion
    var version: String {
        /// 環境変数
        let env: [String: String] = ProcessInfo.processInfo.environment
        guard let version = try? get("SPLATNET2_API_VERSION") else {
            guard let version = env["SPLANET2_API_VERSION"] else {
                return "1.0.0"
            }
            return version
        }

        return version
    }
}
