//
//  SPCredential.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

public class SPCredential: AuthenticationCredential, Codable {
    /// ユーザーID
    public var nsaid: String
    /// スプラトゥーン2で使われる認証トークン
    public var iksmSession: String? = nil
    /// スプラトゥーン3で使われる認証トークン
    public var bulletToken: String? = nil
    /// セッショントークン
    public var sessionToken: String
    /// スプラトゥーントークン
    public var gameServiceToken: String
    /// スプラトゥーンアクセストークン
    public var gameWebToken: String
    /// 有効期限
    public var expiration: Date

    /// 認証トークンのリフレッシュが必要かどうか(2時間に1回リフレッシュが必要)
    public var requiresRefresh: Bool {
        Date(timeIntervalSinceNow: 0) > expiration
    }

    /// GameWebTokenのリフレッシュが必要かどうか(6.5時間に1回リフレッシュが必要)
    public var requiresGameWebTokenRefresh: Bool {
        guard let gameWebToken: JSONWebToken = try? JSONWebToken(gameWebToken: self.gameWebToken) else {
            return true
        }
        let expiredTime: Date = Date(timeIntervalSince1970: TimeInterval(gameWebToken.payload.exp))
        return expiredTime <= Date()
    }

    init(
        sessionToken: SessionToken.Response,
        gameServiceToken: GameServiceToken.Response,
        gameWebToken: GameWebToken.Response,
        bulletToken: BulletToken.Response
    ) {
        self.nsaid = gameServiceToken.result.user.nsaId
        self.sessionToken = sessionToken.sessionToken
        self.gameServiceToken = gameServiceToken.result.webApiServerCredential.accessToken
        self.gameWebToken = gameWebToken.result.accessToken
        self.bulletToken = bulletToken.bulletToken
        self.expiration = Date()
    }

    init(
        sessionToken: SessionToken.Response,
        gameServiceToken: GameServiceToken.Response,
        gameWebToken: GameWebToken.Response,
        iksmSession: IksmSession.Response
    ) {
        self.nsaid = gameServiceToken.result.user.nsaId
        self.sessionToken = sessionToken.sessionToken
        self.gameServiceToken = gameServiceToken.result.webApiServerCredential.accessToken
        self.gameWebToken = gameWebToken.result.accessToken
        self.iksmSession = iksmSession.iksmSession
        self.expiration = Date()
    }
}
