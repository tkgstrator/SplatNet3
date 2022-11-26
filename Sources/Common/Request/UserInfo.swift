//
//  UserInfo.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public struct UserInfo: SPCredential {
    /// ニックネーム
    let nickname: String
    /// メンバーシップ加入しているか
    let membership: Bool
    /// フレンドコード
    let friendCode: String
    /// 画像URL
    let thumbnailURL: URL
    /// ID
    var nsaid: String
    /// イカスミセッション
    var iksmSession: String? = nil
    /// イカリング3トークン
    var bulletToken: String? = nil
    /// セッショントークン
    var sessionToken: String
    /// GameServiceToken
    var gameServiceToken: String
    /// GameWebToken
    var gameWebToken: String
    /// 有効期限
    var expiration: Date
    /// リフレッシュが必要かどうか
    public var requiresRefresh: Bool {
        Date(timeIntervalSinceNow: 0) > expiration
    }

    var requiresGameWebTokenRefresh: Bool {
        guard let token: JSONWebToken = try? JSONWebToken(gameWebToken: gameWebToken) else {
            return true
        }
        return Date(timeIntervalSince1970: TimeInterval(token.payload.exp)) <= Date()
    }

    init(sessionToken: String, gameServiceToken: GameServiceToken.Response, gameWebToken: GameWebToken.Response) {
        self.nickname = gameServiceToken.result.user.name
        self.membership = gameServiceToken.result.user.links.nintendoAccount.membership.active
        self.friendCode = gameServiceToken.result.user.links.friendCode.id
        self.thumbnailURL = URL(unsafeString: gameServiceToken.result.user.imageUri)
        self.nsaid = gameServiceToken.result.user.nsaId
        self.sessionToken = sessionToken
        self.gameServiceToken = gameServiceToken.result.webApiServerCredential.accessToken
        self.gameWebToken = gameWebToken.result.accessToken
        self.expiration = Date(timeIntervalSince1970: 0)
    }

    init(sessionToken: SessionToken.Response, gameServiceToken: GameServiceToken.Response, gameWebToken: GameWebToken.Response, bulletToken: BulletToken.Response) {
        self.init(sessionToken: sessionToken.sessionToken, gameServiceToken: gameServiceToken, gameWebToken: gameWebToken)
        self.bulletToken = bulletToken.bulletToken
        self.expiration = Date(timeIntervalSinceNow: 60 * 60 * 2.5)
    }

    init(sessionToken: SessionToken.Response, gameServiceToken: GameServiceToken.Response, gameWebToken: GameWebToken.Response, iksmSession: IksmSession.Response) {
        self.init(sessionToken: sessionToken.sessionToken, gameServiceToken: gameServiceToken, gameWebToken: gameWebToken)
        self.iksmSession = iksmSession.iksmSession
        self.expiration = Date(timeIntervalSinceNow: 60 * 60 * 23.5)
    }

    init(sessionToken: String, gameServiceToken: GameServiceToken.Response, gameWebToken: GameWebToken.Response, bulletToken: BulletToken.Response) {
        self.init(sessionToken: sessionToken, gameServiceToken: gameServiceToken, gameWebToken: gameWebToken)
        self.bulletToken = bulletToken.bulletToken
        self.expiration = Date(timeIntervalSinceNow: 60 * 60 * 2.5)
    }
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.nickname = try container.decode(String.self, forKey: .nickname)
//        self.membership = try container.decode(Bool.self, forKey: .membership)
//        self.friendCode = try container.decode(String.self, forKey: .friendCode)
//        self.thumbnailURL = URL(unsafeString: try container.decode(String.self, forKey: .thumbnailURL))
//        self.nsaid = try container.decode(String.self, forKey: .nsaid)
//        self.bulletToken = try container.decodeIfPresent(String.self, forKey: .bulletToken)
//        self.iksmSession = try container.decodeIfPresent(String.self, forKey: .iksmSession)
//        self.sessionToken = try container.decode(String.self, forKey: .sessionToken)
//        self.gameServiceToken = try container.decode(String.self, forKey: .gameServiceToken)
//        self.gameWebToken = try container.decode(String.self, forKey: .gameWebToken)
//        self.expiration = try container.decode(Date.self, forKey: .expiration)
//    }
}

extension UserInfo: Identifiable, Hashable, Equatable {
    public static func == (lhs: UserInfo, rhs: UserInfo) -> Bool {
        lhs.id == rhs.id
    }

    public static func != (lhs: UserInfo, rhs: UserInfo) -> Bool {
        lhs.id != rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public var id: String { nsaid }
}
