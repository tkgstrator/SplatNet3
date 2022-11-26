//
//  Authorize.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import Alamofire
import SwiftyBeaver
import KeychainAccess

/// 認証用のクラス
open class Authorize {
    /// 通信用のセッション
    let session: Alamofire.Session = {
        let configuration: URLSessionConfiguration = {
            let config: URLSessionConfiguration = URLSessionConfiguration.default
            config.httpMaximumConnectionsPerHost = 5
            config.timeoutIntervalForRequest = 10
            config.allowsCellularAccess = true
            return config
        }()
        return Session(configuration: configuration)
    }()
    /// SwiftyBeaverでログ保存
    let logger: SwiftyBeaver.Type = SwiftyBeaver.self
    /// ローカルにログ保存
    let local: FileDestination = FileDestination()
    /// コンソールに出力
    let console: ConsoleDestination = {
        let console = ConsoleDestination()
        console.format = "$DHH:mm:ss$d $L $M $X"
        return console
    }()
    /// Keychainでアカウント管理
    let keychain: Keychain = Keychain(service: Bundle.main.bundleIdentifier!)
    /// レスポンスのデコーダー
    let decoder: SPDecoder = SPDecoder()

    /// ログインしているアカウント
    var account: UserInfo? {
        get {
            keychain.get()
        }
        set {
            keychain.set(newValue)
        }
    }
    /// ローカルにログ保存
    public init() {
        if self.logger.destinations.isEmpty {
            self.logger.addDestination(local)
            self.logger.addDestination(console)
        }
    }

    /// クラウドにログ保存
    convenience public init(appId: String, appSecret: String, encryptionKey: String) {
        self.init()
        let cloud: SBPlatformDestination = SBPlatformDestination(appID: appId, appSecret: appSecret, encryptionKey: encryptionKey)
        self.logger.addDestination(cloud)
    }

    func request<T: RequestType>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> String {
        try await session.request(request, interceptor: interceptor)
            .validationWithNXError()
            .serializingString(encoding: .utf8)
            .value
    }

    func request<T: RequestType>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> T.ResponseType {
        try await session.request(request, interceptor: interceptor)
            .validationWithNXError()
            .serializingDecodable(T.ResponseType.self, decoder: decoder)
            .value
    }

    private func getSessionToken(code: String, verifier: String) async throws -> SessionToken.Response {
        try await request(SessionToken(code: code, verifier: verifier))
    }

    private func getAccessToken(sessionToken: SessionToken.Response) async throws -> AccessToken.Response {
        try await request(AccessToken(sessionToken: sessionToken))
    }

    private func getAccessToken(sessionToken: String) async throws -> AccessToken.Response {
        try await request(AccessToken(sessionToken: sessionToken))
    }

    private func getHash(accessToken: AccessToken.Response) async throws -> Imink.Response {
        do {
            return try await request(Imink(accessToken: accessToken, server: .Imink))
        } catch {
            return try await request(Imink(accessToken: accessToken, server: .Flapg), interceptor: self)
        }
    }

    private func getHash(accessToken: GameServiceToken.Response) async throws -> Imink.Response {
        do {
            return try await request(Imink(accessToken: accessToken, server: .Imink))
        } catch {
            return try await request(Imink(accessToken: accessToken, server: .Flapg), interceptor: self)
        }
    }

    private func getVersion() async throws -> Version.Response {
        Version.Response(from: try await request(Version()))
    }

    private func getWebVersion() async throws -> WebVersion.Response {
        WebVersion.Response(from: try await request(WebVersion()))
    }

    private func getGameServiceToken(accessToken: AccessToken.Response, version: Version.Response) async throws -> GameServiceToken.Response {
        let response: Imink.Response = try await getHash(accessToken: accessToken)
        return try await request(GameServiceToken(imink: response, accessToken: accessToken, version: version))
    }

    private func getGameWebToken(accessToken: GameServiceToken.Response, version: Version.Response, contentId: ContentId) async throws -> GameWebToken.Response {
        let response: Imink.Response = try await getHash(accessToken: accessToken)
        return try await request(GameWebToken(imink: response, accessToken: accessToken, version: version, contentId: contentId))
    }

    private func getBulletToken(gameWebToken: GameWebToken.Response, version: WebVersion.Response) async throws -> BulletToken.Response {
        try await request(BulletToken(accessToken: gameWebToken, version: version))
    }

    private func getBulletToken(gameWebToken: String, version: WebVersion.Response) async throws -> BulletToken.Response {
        try await request(BulletToken(accessToken: gameWebToken, version: version))
    }

    /// SessionTokenCodeとVerifierからトークンを生成
    @discardableResult
    internal func getBulletToken(code: String, verifier: String) async throws -> UserInfo {
        let sessionToken: SessionToken.Response = try await getSessionToken(code: code, verifier: verifier)
        return try await getBulletToken(sessionToken: sessionToken)
    }

    /// SessionTokenからトークンを生成
    @discardableResult
    internal func getBulletToken(sessionToken: SessionToken.Response) async throws -> UserInfo {
        return try await getBulletToken(sessionToken: sessionToken.sessionToken)
    }

    /// GameWebTokenからトークンを生成
    @discardableResult
    func refreshBulletToken(gameWebToken: String) async throws -> UserInfo {
        logger.debug("Refresh Bullet Token: with Game Web Token")
        guard let account = self.account else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Could not decode UserInfo"))
        }
        let version: WebVersion.Response = try await getWebVersion()
        let bulletToken: BulletToken.Response = try await getBulletToken(gameWebToken: gameWebToken, version: version)
        self.account?.bulletToken = bulletToken.bulletToken
        self.account?.expiration = Date(timeIntervalSinceNow: 60 * 60 * 2.5)
        return account
    }

    /// SessionTokenからトークンを生成
    @discardableResult
    func getBulletToken(sessionToken: String) async throws -> UserInfo {
        logger.debug("Get Bullet Token: with Session Token")
        let accessToken: AccessToken.Response = try await getAccessToken(sessionToken: sessionToken)
        let version: Version.Response = try await getVersion()
        let gameServiceToken: GameServiceToken.Response =  try await getGameServiceToken(accessToken: accessToken, version: version)
        let gameWebToken: GameWebToken.Response = try await getGameWebToken(accessToken: gameServiceToken, version: version, contentId: .SP3)
        let webVersion: WebVersion.Response = try await getWebVersion()
        let bulletToken: BulletToken.Response = try await getBulletToken(gameWebToken: gameWebToken, version: webVersion)
        let account: UserInfo = UserInfo(sessionToken: sessionToken, gameServiceToken: gameServiceToken, gameWebToken: gameWebToken, bulletToken: bulletToken)
        /// アカウント情報を保存
        self.account = account
        return account
    }
}
