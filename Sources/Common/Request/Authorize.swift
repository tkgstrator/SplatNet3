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
    let console: ConsoleDestination = ConsoleDestination()
    /// Keychainでアカウント管理
    let keychain: Keychain = Keychain(service: Bundle.main.bundleIdentifier!)
    /// レスポンスのデコーダー
    let decoder: JSONDecoder = {
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

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
        self.logger.addDestination(local)
        self.logger.addDestination(console)
        dump(account)
    }

    /// クラウドにログ保存
    convenience public init(appId: String, appSecret: String, encryptionKey: String) {
        self.init()
        let cloud: SBPlatformDestination = SBPlatformDestination(appID: appId, appSecret: appSecret, encryptionKey: encryptionKey)
        self.logger.addDestination(cloud)
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
        let response: String = try await session.request(Version())
            .validationWithNXError()
            .serializingString()
            .value
        return Version.Response(from: response)
    }

    private func getWebVersion() async throws -> WebVersion.Response {
        let response: String = try await session.request(WebVersion())
            .validationWithNXError()
            .serializingString(encoding: .utf8)
            .value
        return WebVersion.Response(from: response)
    }

    private func getGameServiceToken(accessToken: AccessToken.Response, version: Version.Response) async throws -> GameServiceToken.Response {
        let response: Imink.Response = try await getHash(accessToken: accessToken)
        return try await request(GameServiceToken(imink: response, accessToken: accessToken, version: version))
    }

    private func getGameWebToken(accessToken: GameServiceToken.Response, version: Version.Response, contentId: ContentId) async throws -> GameWebToken.Response {
        let response: Imink.Response = try await getHash(accessToken: accessToken)
        return try await request(GameWebToken(imink: response, accessToken: accessToken, version: version, contentId: contentId))
    }

    /// GameWebTokenとWebVersionからトークンを生成
    private func getBulletToken(gameWebToken: GameWebToken.Response, version: WebVersion.Response) async throws -> BulletToken.Response {
        try await request(BulletToken(accessToken: gameWebToken, version: version))
    }

    /// SessionTokenCodeとVerifierからトークンを生成
    internal func getBulletToken(code: String, verifier: String) async throws -> UserInfo {
        let sessionToken: SessionToken.Response = try await getSessionToken(code: code, verifier: verifier)
        return try await getBulletToken(sessionToken: sessionToken)
    }

    /// SessionTokenからトークンを生成
    func getBulletToken(sessionToken: SessionToken.Response) async throws -> UserInfo {
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
