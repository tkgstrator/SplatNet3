//
//  SplatNet3+Publisher.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/03.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Foundation
import Common
import Alamofire

extension SplatNet3 {
    /// バージョン書き込み
    public func setVersion(version: WebVersion.Response) throws {
        try keychain.setVersion(version)
    }

    /// アカウント新規追加
    public func set(_ account: UserInfo) throws {
        try keychain.set(account)
    }

    /// アカウント追加
    public func add(_ account: UserInfo) throws {
        try keychain.add(account)
    }

    /// アカウント削除
    public func remove(_ account: UserInfo) throws {
    }

    /// アカウント全削除
    public func removeAll() throws {
        try keychain.removeAll()
    }

    /// アカウント
    public var accounts: [UserInfo] {
        keychain.get()
    }
}
