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
    static private let bundle: String = "X-Web-View-Ver"

    /// X-Web-View-Ver
    var version: String {
        get {
            (try? get(Keychain.bundle)) ?? "2.0.0-bd36a652"
        }
        set {
            if let data: Data = newValue.data(using: .utf8) {
                try? set(data, key: Keychain.bundle)
            } else {
                try? set("2.0.0-bd36a652".data(using: .utf8)!, key: Keychain.bundle)
            }
        }
    }
    
    /// アカウント書き込み
    @discardableResult
    func set(_ account: UserInfo?) -> UserInfo? {
        if let account = account {
            try? set(try account.asData(), key: Bundle.main.bundleIdentifier!)
        }
        return account
    }

    func delete() {
        try? remove(Bundle.main.bundleIdentifier!)
    }

    /// アカウントアップデート
    @discardableResult
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

    /// アカウント取得
    func get() -> UserInfo? {
        let decoder: JSONDecoder = JSONDecoder()

        guard let data: Data = try? getData(Bundle.main.bundleIdentifier!) else {
            return nil
        }

        do {
            return try decoder.decode(UserInfo.self, from: data)
        } catch (let error) {
            SwiftyLogger.error(error.localizedDescription)
            return nil
        }
    }
}
