//
//  SplatNet3+Cookie.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire
import Common

extension SplatNet3 {
    /// GameWebTokenから生成
    internal func refreshTokenByGameWebToken(gameWebToken: String) async throws -> UserInfo {
        guard let account = account else {
            throw Failure.API(error: NXError.API.account)
        }
        
        let bulletToken: BulletToken.Response = try await getBulletToken(accessToken: gameWebToken)

        return UserInfo(
            nickname: account.nickname,
            membership: account.membership,
            friendCode: account.friendCode,
            thumbnailURL: account.thumbnailURL,
            nsaid: account.credential.nsaid,
            iksmSession: account.credential.iksmSession,
            bulletToken: bulletToken.bulletToken,
            sessionToken: account.credential.sessionToken,
            gameServiceToken: account.credential.gameServiceToken,
            gameWebToken: account.credential.gameWebToken
        )
    }

    /// SessionTokenから生成
    internal func refreshToken(sessionToken: String) async throws -> UserInfo {
        // バージョンを取得
        let version: String = try await getVersionFromAppStore().version
        // アクセストークン
        let accessToken: AccessToken.Response = try await getAccessToken(sessionToken: sessionToken)
        // F
        let iminkNSO: Imink.Response = try await getIminkToken(accessToken: accessToken)
        // スプラトゥーントークン
        let gameServiceToken: SplatoonToken.Response = try await getSplatoonToken(accessToken: accessToken, imink: iminkNSO, version: version)
        // F
        let iminkAPP: Imink.Response = try await getIminkToken(accessToken: gameServiceToken)
        // スプラトゥーンアクセストークン
        let gameWebToken: SplatoonAccessToken.Response = try await getSplatoonAccessToken(accessToken: gameServiceToken, imink: iminkAPP, version: version)
        // WebVersionをアップデートしてみる(リアルタイムアップデートされる？)
        try setVersion(version: try await getWebVersion())

        // トークン
        let bulletToken: BulletToken.Response = try await getBulletToken(accessToken: gameWebToken)

        return UserInfo(
            sessionToken: sessionToken,
            gameServiceToken: gameServiceToken,
            gameWebToken: gameWebToken,
            bulletToken: bulletToken
        )
    }

    /// ハッシュバージョンを取得
    internal func getWebVersion() async throws -> WebVersion.Response {
        return try await request(WebVersion())
    }

    /// バージョンを取得
    internal func getVersion() async throws -> XVersion.Response {
        let request: XVersion = XVersion()
        return try await authorize(request)
    }

    /// スクレイピングで最新のバージョンを取得
    internal func getVersionFromAppStore() async throws -> Version.Response {
        return try await request(Version())
    }

    /// イカスミセッションをコードとベリファイアから取得
    public func getCookie(code: String, verifier: String) async throws {
        let sessionToken: SessionToken.Response = try await getSessionToken(code: code, verifier: verifier)
        let account: UserInfo =  try await refreshToken(sessionToken: sessionToken.sessionToken)
        try set(account)
    }

    /// セッショントークン取得
    internal func getSessionToken(code: String, verifier: String) async throws -> SessionToken.Response {
        let request: SessionToken = SessionToken(code: code, verifier: verifier)
        return try await authorize(request)
    }

    /// アクセストークン取得
    internal func getAccessToken(sessionToken: String) async throws -> AccessToken.Response {
        let request: AccessToken = AccessToken(sessionToken: sessionToken)
        return try await authorize(request)
    }

    /// アクセストークン取得
    internal func getAccessToken(sessionToken: SessionToken.Response) async throws -> AccessToken.Response {
        let request: AccessToken = AccessToken(sessionToken: sessionToken)
        return try await authorize(request)
    }

    /// スプラトゥーントークン取得
    internal func getSplatoonToken(accessToken: AccessToken.Response, imink: Imink.Response, version: String) async throws -> SplatoonToken.Response {
        let request: SplatoonToken = SplatoonToken(imink: imink, accessToken: accessToken.accessToken, version: version)
        return try await authorize(request)
    }

    /// スプラトゥーンアクセストークン取得
    internal func getSplatoonAccessToken(accessToken: SplatoonToken.Response, imink: Imink.Response, version: String) async throws -> SplatoonAccessToken.Response {
        let request: SplatoonAccessToken = SplatoonAccessToken(imink: imink, accessToken: accessToken, version: version, authType: .SP3)
        return try await authorize(request)
    }

    /// ハッシュ取得
    internal func getIminkToken(accessToken: AccessToken.Response) async throws -> Imink.Response {
        let request: Imink = Imink(accessToken: accessToken)
        return try await authorize(request)
    }

    /// ハッシュ取得
    internal func getIminkToken(accessToken: SplatoonToken.Response) async throws -> Imink.Response {
        let request: Imink = Imink(accessToken: accessToken)
        return try await authorize(request)
    }

    /// イカスミセッション取得
    internal func getBulletToken(accessToken: SplatoonAccessToken.Response) async throws -> BulletToken.Response {
        let request: BulletToken = BulletToken(accessToken: accessToken, version: version)
        return try await authorize(request)
    }

    /// イカスミセッション取得
    private func getBulletToken(accessToken: String) async throws -> BulletToken.Response {
        let request: BulletToken = BulletToken(accessToken: accessToken, version: version)
        return try await authorize(request)
    }
}
