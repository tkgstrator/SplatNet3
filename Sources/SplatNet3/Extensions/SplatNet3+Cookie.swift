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
    /// イカスミセッションをセッショントークンから取得
    internal func refreshToken(sessionToken: String) async throws -> UserInfo {
        // AppStoreから最新のバージョンを取得
        guard let result: XVersion.Information = try await getVersion().results.first else {
            // なければエラーを返す
            throw AFError.responseValidationFailed(reason: .unacceptableStatusCode(code: 404))
        }
        // バージョンを取得
        let version: String = result.version
        // アクセストークン
        let accessToken: AccessToken.Response = try await getAccessToken(sessionToken: sessionToken)
        // F
        let iminkNSO: Imink.Response = try await getIminkToken(accessToken: accessToken)
        // スプラトゥーントークン
        let splatoonToken: SplatoonToken.Response = try await getSplatoonToken(accessToken: accessToken, imink: iminkNSO, version: version)
        // F
        let iminkAPP: Imink.Response = try await getIminkToken(accessToken: splatoonToken)
        // スプラトゥーンアクセストークン
        let splatoonAccessToken: SplatoonAccessToken.Response = try await getSplatoonAccessToken(accessToken: splatoonToken, imink: iminkAPP, version: version)
        // WebVersionをアップデートしてみる(リアルタイムアップデートされる？)
        try setVersion(version: try await getWebVersion())

        // トークン
        let bulletToken: BulletToken.Response = try await getBulletToken(accessToken: splatoonAccessToken)

        return UserInfo(
            sessionToken: sessionToken,
            splatoonToken: splatoonToken,
            bulletToken: bulletToken
        )
    }

    internal func getWebVersion() async throws -> WebVersion.Response {
        return try await request(WebVersion())
    }

    /// バージョンを取得
    internal func getVersion() async throws -> XVersion.Response {
        let request: XVersion = XVersion()
        return try await authorize(request)
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
}
