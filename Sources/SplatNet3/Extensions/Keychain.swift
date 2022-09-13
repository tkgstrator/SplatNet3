//
//  Keychain.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/05/01.
//  Copyright © 2021 Magi, Corporation. All rights reserved.

import Foundation
import Common
import KeychainAccess

public extension Keychain {
    /// アカウント上書き
    func set(_ account: UserInfo) throws {
        try set(try account.asData(), key: "SplatNet3_ACCOUNTS")
    }

    /// アカウント上書き
    func set(_ accounts: [UserInfo]) throws {
        try set(try accounts.asData(), key: "SplatNet3_ACCOUNTS")
    }

    /// アカウント追加
    func add(_ account: UserInfo) throws {
        let accounts: [UserInfo] = (get() + [account]).sorted(by: { $0.credential.nsaid < $1.credential.nsaid })
        try set(accounts)
    }

    /// アカウント取得
    func get() -> [UserInfo] {
        let decoder: JSONDecoder = {
            let decoder: JSONDecoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()
        guard let data: Data = try? getData("SplatNet3_ACCOUNTS") else {
            return []
        }
        guard let accounts: [UserInfo] = try? decoder.decode([UserInfo].self, from: data) else {
            return []
        }
        return accounts
    }
}
