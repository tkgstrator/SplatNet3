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
    /// バージョン上書き
    func setVersion(_ version: WebVersion.Response) throws {
        try set(try version.asData(), key: "SplatNet3_WEBVER")
    }

    /// バージョン取得
    func getVersion() -> WebVersion.Response {
        let decoder: JSONDecoder = {
            let decoder: JSONDecoder = JSONDecoder()
            return decoder
        }()

        do {
            guard let data: Data = try getData("SplatNet3_WEBVER") else {
                return WebVersion.Response(version: "1.0.0", hash: "d3a90678")
            }
            return try decoder.decode(WebVersion.Response.self, from: data)
        } catch (_) {
            return WebVersion.Response(version: "1.0.0", hash: "d3a90678")
        }
    }

    /// アカウント上書き
    func set(_ account: UserInfo) throws {
        try set(try [account].asData(), key: "SplatNet3_ACCOUNTS")
    }

    /// アカウント上書き
    func set(_ accounts: [UserInfo]) throws {
        try set(try accounts.asData(), key: "SplatNet3_ACCOUNTS")
    }

    @discardableResult
    func resetExpiresIn() throws -> UserInfo {
        if let account: UserInfo = get().first {
            let newValue: UserInfo = UserInfo(
                nickname: account.nickname,
                membership: account.membership,
                friendCode: account.friendCode,
                thumbnailURL: account.thumbnailURL,
                nsaid: account.credential.nsaid,
                iksmSession: account.credential.iksmSession,
                bulletToken: account.credential.bulletToken,
                sessionToken: account.credential.sessionToken,
                gameServiceToken: account.credential.gameServiceToken,
                gameWebToken: account.credential.gameWebToken,
                expiresIn: Date(timeIntervalSince1970: 0)
            )
            // 上書きして保存
            try set(newValue)
            return newValue
        }
        throw Failure.API(error: NXError.API.account)
    }

    /// アカウント追加
    func add(_ account: UserInfo) throws {
        let accounts: [UserInfo] = Array(Set(get() + [account]).sorted(by: { $0.credential.nsaid < $1.credential.nsaid }))
        try set(accounts)
    }

    /// アカウント取得
    func get() -> [UserInfo] {
        let decoder: JSONDecoder = {
            let decoder: JSONDecoder = JSONDecoder()
            return decoder
        }()

        do {
            guard let data: Data = try getData("SplatNet3_ACCOUNTS") else {
                return []
            }
            let accounts: [UserInfo] = try decoder.decode([UserInfo].self, from: data)
            return accounts
        } catch (let error) {
            return []
        }
    }
}
