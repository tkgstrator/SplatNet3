//
//  SplatNet2+Cookie.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire
import Common

extension SplatNet2 {
    internal func authorize<T: RequestType>(_ request: T) async throws -> T.ResponseType {
        return try await session.request(request)
            .cURLDescription()
            .validationWithNXError()
            .serializingDecodable(T.ResponseType.self, decoder: decoder)
            .value
    }

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
        // スプラトゥーントークン
        let splatoonToken: SplatoonToken.Response = try await getSplatoonToken(accessToken: accessToken, version: version)
        // スプラトゥーンアクセストークン
        let splatoonAccessToken: SplatoonAccessToken.Response = try await getSplatoonAccessToken(accessToken: splatoonToken, version: version)
        // イカスミセッション
        let iksmSession: IksmSession.Response = try await getIksmSession(accessToken: splatoonAccessToken)

        return UserInfo(
            sessionToken: sessionToken,
            splatoonToken: splatoonToken,
            splatoonAccessToken: splatoonAccessToken,
            iksmSession: iksmSession
        )
    }

    /// バージョンを取得
    internal func getVersion() async throws -> XVersion.Response {
        let request: XVersion = XVersion()
        return try await authorize(request)
    }

    /// イカスミセッションをコードとベリファイアから取得
    internal func getCookie(code: String, verifier: String) async throws -> UserInfo {
        let sessionToken: SessionToken.Response = try await getSessionToken(code: code, verifier: verifier)
        return try await refreshToken(sessionToken: sessionToken.sessionToken)
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
    internal func getSplatoonToken(accessToken: AccessToken.Response, version: String) async throws -> SplatoonToken.Response {
        let imink: Imink.Response = try await getIminkToken(accessToken: accessToken)
        let request: SplatoonToken = SplatoonToken(imink: imink, accessToken: accessToken.accessToken, version: version)
        return try await authorize(request)
    }

    /// スプラトゥーンアクセストークン取得
    internal func getSplatoonAccessToken(accessToken: SplatoonToken.Response, version: String) async throws -> SplatoonAccessToken.Response {
        let imink: Imink.Response = try await getIminkToken(accessToken: accessToken)
        let request: SplatoonAccessToken = SplatoonAccessToken(imink: imink, accessToken: accessToken, version: version, authType: .SP2)
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
    internal func getIksmSession(accessToken: SplatoonAccessToken.Response) async throws -> IksmSession.Response {
        let request: IksmSession = IksmSession(accessToken: accessToken.result.accessToken)
        return try await generate(request)
    }
}
