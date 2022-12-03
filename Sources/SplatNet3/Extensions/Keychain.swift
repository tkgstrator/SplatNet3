//
//  Keychain.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import KeychainAccess

extension Keychain {
    static let bundleIdentifier: String = "SPLATNET_ACCOUNTS"

    func set(_ account: UserInfo?) {
        if let account = account {
            try? set(try account.asData(), key: Keychain.bundleIdentifier)
        }
    }

    func update(_ bulletToken: BulletToken.Response) throws -> UserInfo {
        guard var account: UserInfo = self.get() else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Account Not Found"))
        }
        /// アップデートする
        account.bulletToken = bulletToken.bulletToken
        account.expiration = Date(timeIntervalSinceNow: 60 * 60 * 2)
        self.set(account)
        return account
    }

    func get() -> UserInfo? {
        let decoder: JSONDecoder = JSONDecoder()

        guard let data: Data = try? getData(Keychain.bundleIdentifier) else {
            return nil
        }

        do {
            return try decoder.decode(UserInfo.self, from: data)
        } catch (let error) {
            print(error)
            return nil
        }
    }
}
