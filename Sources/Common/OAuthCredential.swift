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
    public init(nsaid: String, iksmSession: String, sessionToken: String, splatoonToken: String) {
        self.nsaid = nsaid
        self.iksmSession = iksmSession
        self.sessionToken = sessionToken
        self.splatoonToken = splatoonToken
        self.expiration = {
            #if DEBUG
            Date(timeIntervalSinceNow: 60)
            #else
            Date(timeIntervalSinceNow: 86400)
            #endif
        }()
    }

    /// ユーザーID
    public let nsaid: String
    /// イカスミセッション
    public let iksmSession: String
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
