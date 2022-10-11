//
//  UserInfo.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.

import Foundation

public struct UserInfo: Codable {
    public init(
        nickname: String,
        membership: Bool,
        friendCode: String,
        thumbnailURL: URL,
        nsaid: String,
        iksmSession: String?, // For Splatoon2
        bulletToken: String?, // For Splatoon3
        sessionToken: String,
        gameServiceToken: String,
        gameWebToken: String,
        timeInterval: Double = 60 * 60 * 1.5
    ) {
        self.nickname = nickname
        self.membership = membership
        self.friendCode = friendCode
        self.thumbnailURL = thumbnailURL
        self.credential = OAuthCredential(
            nsaid: nsaid,
            iksmSession: iksmSession,
            bulletToken: bulletToken,
            sessionToken: sessionToken,
            gameServiceToken: gameServiceToken,
            gameWebToken: gameWebToken,
            timeInterval: timeInterval
        )
    }

    public init(
        nickname: String,
        membership: Bool,
        friendCode: String,
        thumbnailURL: URL,
        nsaid: String,
        iksmSession: String?, // For Splatoon2
        bulletToken: String?, // For Splatoon3
        sessionToken: String,
        gameServiceToken: String,
        gameWebToken: String,
        expiresIn: Date
    ) {
        self.nickname = nickname
        self.membership = membership
        self.friendCode = friendCode
        self.thumbnailURL = thumbnailURL
        self.credential = OAuthCredential(
            nsaid: nsaid,
            iksmSession: iksmSession,
            bulletToken: bulletToken,
            sessionToken: sessionToken,
            gameServiceToken: gameServiceToken,
            gameWebToken: gameWebToken,
            expiresIn: expiresIn
        )
    }

    /// ニックネーム
    public let nickname: String
    /// メンバーシップ加入しているか
    public let membership: Bool
    /// フレンドコード
    public let friendCode: String
    /// 画像URL
    public let thumbnailURL: URL
    /// 認証
    public let credential: OAuthCredential
    /// サーモンランリザルト
//    public let coop: CoopInfo
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

    public var id: String { credential.nsaid }
}
