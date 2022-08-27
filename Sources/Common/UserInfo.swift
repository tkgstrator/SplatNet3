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
        iksmSession: String,
        sessionToken: String,
        splatoonToken: String,
        timeInterval: Double = 60 * 60 * 24
    ) {
        self.nickname = nickname
        self.membership = membership
        self.friendCode = friendCode
        self.thumbnailURL = thumbnailURL
        self.credential = OAuthCredential(
            nsaid: nsaid,
            iksmSession: iksmSession,
            sessionToken: sessionToken,
            splatoonToken: splatoonToken,
            timeInterval: timeInterval
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
