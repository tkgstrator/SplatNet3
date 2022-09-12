//
//  OAuthCredential.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

public struct OAuthCredential: AuthenticationCredential, Codable {
    public init(nsaid: String, iksmSession: String?, bulletToken: String?, sessionToken: String, splatoonToken: String) {
        self.nsaid = nsaid
        self.iksmSession = iksmSession
        self.bulletToken = bulletToken
        self.sessionToken = sessionToken
        self.splatoonToken = splatoonToken
        self.expiration = {
            #if DEBUG
            Date(timeIntervalSinceNow: -10)
            #else
            Date(timeIntervalSinceNow: 7200)
            #endif
        }()
    }

    internal init(nsaid: String, iksmSession: String?, bulletToken: String?, sessionToken: String, splatoonToken: String, timeInterval: Double = 60 * 60 * 2) {
        self.nsaid = nsaid
        self.iksmSession = iksmSession
        self.sessionToken = sessionToken
        self.splatoonToken = splatoonToken
        self.bulletToken = bulletToken
        self.expiration = {
            #if DEBUG
            Date(timeIntervalSinceNow: timeInterval)
            #else
            Date(timeIntervalSinceNow: 7200)
            #endif
        }()
    }

    /// ユーザーID
    public let nsaid: String
    /// セッション For Splatoon 2
    public let iksmSession: String?
    /// セッション For Splatoon 3
    public let bulletToken: String?
    /// セッショントークン
    public let sessionToken: String
    /// スプラトゥーントークン
    public let splatoonToken: String
    /// 有効期限
    public let expiration: Date
    /// 更新が必要かどうかのチェック
    /// 有効期限が現在よりも前ならリフレッシュが必要
    public var requiresRefresh: Bool { Date(timeIntervalSinceNow: 0) > expiration }
}
