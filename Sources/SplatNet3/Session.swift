//
//  Session.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire
import KeychainAccess
import SwiftyBeaver

/// 基本となるリクエストなどが定義されたクラス
open class Session {
    /// 通信用のセッション
    public let session: Alamofire.Session = {
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.httpCookieAcceptPolicy = .never
        configuration.allowsCellularAccess = true
        return Alamofire.Session(configuration: configuration)
    }()

    /// キーチェイン
    private let keychain: Keychain = Keychain(service: Bundle.module.bundleIdentifier!)

    /// デコーダー
    public let decoder: SPDecoder = SPDecoder()

    /// アカウント
    public var account: UserInfo? {
        get {
            keychain.get()
        }
    }

    init() {}

    /// 一般的に使うリクエスト
    open func request<T: RequestType>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> T.ResponseType {
        try await withSwiftyLogger(execute: {
            try await session.request(request, interceptor: interceptor)
                .validationWithNXError()
                .serializingDecodable(T.ResponseType.self, decoder: decoder)
                .value
        })
    }

    /// 文字列を取得するためのリクエスト
    open func request<T: RequestType>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> String {
        try await withSwiftyLogger(execute: {
            try await session.request(request, interceptor: interceptor)
                .validationWithNXError()
                .serializingString(encoding: .utf8)
                .value
        })
    }

    /// イカスミセッション専用のリクエスト
    func request(_ request: IksmSession) async -> [String: String]? {
        try? await withSwiftyLogger(execute: {
            await session.request(request)
                .validationWithNXError()
                .serializingString()
                .response
                .response?.allHeaderFields as? [String: String]
        })
    }

    /// SP2/3: URLSchemeを使って認証情報を取得
    @discardableResult
    public func getCookie(code: String, verifier: String, contentId: ContentId) async throws -> UserInfo {
        let sessionToken: SessionToken.Response = try await getSessionToken(code: code, verifier: verifier)
        return try await refresh(sessionToken: sessionToken.sessionToken, contentId: contentId)
    }

    /// SP3: GameWebTokenを使って認証情報を取得
    public func refresh(gameWebToken: String) async throws -> UserInfo {
        let bulletToken: BulletToken.Response = try await getBulletToken(gameWebToken: gameWebToken)
        return try keychain.update(bulletToken)
    }

    public func refresh(contentId: ContentId) async throws -> UserInfo {
        guard let account = self.account else {
            throw DecodingError.valueNotFound(UserInfo.self, .init(codingPath: [], debugDescription: "Account Not Found"))
        }
        if account.requiresGameWebTokenRefresh {
            return try await refresh(sessionToken: account.sessionToken, contentId: contentId)
        }
        if account.requiresRefresh {
            return try await refresh(gameWebToken: account.gameWebToken)
        }
        return account
    }

    /// SP2/3: SessionTokenを使って認証情報を取得
    public func refresh(sessionToken: String, contentId: ContentId) async throws -> UserInfo {
        let accessToken: AccessToken.Response = try await getAccessToken(sessionToken: sessionToken)
        let version: XVersion.Response = try await getXVersion()
        let gameServiceToken: GameServiceToken.Response = try await getGameServiceToken(accessToken: accessToken, version: version)
        let gameWebToken: GameWebToken.Response = try await getGameWebToken(accessToken: gameServiceToken, version: version, contentId: contentId)
        switch contentId {
        case .SP2:
            let iksmSession: IksmSession.Response = try await getIksmSession(gameWebToken: gameWebToken)
            let account: UserInfo = UserInfo(sessionToken: sessionToken, gameServiceToken: gameServiceToken, gameWebToken: gameWebToken, iksmSession: iksmSession)
            self.keychain.set(account)
            return account
        case .SP3:
            let bulletToken: BulletToken.Response = try await getBulletToken(gameWebToken: gameWebToken)
            let account: UserInfo = UserInfo(sessionToken: sessionToken, gameServiceToken: gameServiceToken, gameWebToken: gameWebToken.result.accessToken, bulletToken: bulletToken)
            self.keychain.set(account)
            return account
        }
    }
}

/// 秘匿したい関数を定義したExtension
extension Session: RequestInterceptor {
    private func withSwiftyLogger<T>(execute: () async throws -> T) async throws -> T {
        do {
            return try await execute()
        } catch(let error) {
            SwiftyBeaver.error(error.localizedDescription)
            throw error
        }
    }

    /// 通信失敗した場合のリトライ
    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(request.retryCount == 0 ? .retryWithDelay(0.5) : .doNotRetry)
    }

    /// セッショントークン取得
    func getSessionToken(code: String, verifier: String) async throws -> SessionToken.Response {
        try await request(SessionToken(code: code, verifier: verifier))
    }

    /// アクセストークン取得
    func getAccessToken(sessionToken: String) async throws -> AccessToken.Response {
        try await request(AccessToken(sessionToken: sessionToken))
    }

    /// ハッシュ取得
    func getHash(accessToken: AccessToken.Response) async throws -> Imink.Response {
        do {
            return try await request(Imink(accessToken: accessToken, server: .Imink))
        } catch(let error) {
            SwiftyLogger.error(error.localizedDescription)
            return try await request(Imink(accessToken: accessToken, server: .Flapg), interceptor: self)
        }
    }

    /// ハッシュ取得
    func getHash(accessToken: GameServiceToken.Response) async throws -> Imink.Response {
        do {
            return try await request(Imink(accessToken: accessToken, server: .Imink))
        } catch(let error) {
            SwiftyLogger.error(error.localizedDescription)
            return try await request(Imink(accessToken: accessToken, server: .Flapg), interceptor: self)
        }
    }

    /// X-ProductVersion取得
    func getXVersion() async throws -> XVersion.Response {
        let response: String = try await request(XVersion())
        return XVersion.Response(context: response)
    }

    /// WebVersion取得
    func getWebVersion() async throws -> WebVersion.Response {
        let response: String = try await request(WebVersion())
        return WebVersion.Response(context: response)
    }

    /// GameServiceToken取得
    func getGameServiceToken(accessToken: AccessToken.Response, version: XVersion.Response) async throws -> GameServiceToken.Response {
        let response : Imink.Response = try await getHash(accessToken: accessToken)
        return try await request(GameServiceToken(imink: response, accessToken: accessToken, version: version))
    }

    /// GameWebToken取得
    func getGameWebToken(accessToken: GameServiceToken.Response, version: XVersion.Response, contentId: ContentId) async throws -> GameWebToken.Response {
        let response : Imink.Response = try await getHash(accessToken: accessToken)
        return try await request(GameWebToken(imink: response, accessToken: accessToken, contentId: contentId))
    }

    /// BulletToken取得
    func getBulletToken(gameWebToken: GameWebToken.Response) async throws -> BulletToken.Response {
        let response: WebVersion.Response = try await getWebVersion()
        return try await request(BulletToken(accessToken: gameWebToken.result.accessToken, version: response))
    }

    /// BulletToken取得
    func getBulletToken(gameWebToken: String) async throws -> BulletToken.Response {
        let response: WebVersion.Response = try await getWebVersion()
        return try await request(BulletToken(accessToken: gameWebToken, version: response))
    }

    /// IksmSession取得
    func getIksmSession(gameWebToken: GameWebToken.Response) async throws -> IksmSession.Response {
        let headers: [String: String]? = await request(IksmSession(accessToken: gameWebToken.result.accessToken))
        return try IksmSession.Response(headers: headers)
    }
}
