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
open class OAuthSession: Alamofire.Session {
    /// SwiftyBeaverでログ保存
    public let logger: SwiftyBeaver.Type = SwiftyBeaver.self
    /// ローカルにログ保存
    let local: FileDestination = FileDestination()
    /// コンソールに出力
    let console: ConsoleDestination = {
        let console = ConsoleDestination()
        console.format = "$DHH:mm:ss$d $L$c $N.$F:$l - $M"
        return console
    }()
    /// Keychainでアカウント管理
    let keychain: Keychain = Keychain(service: Bundle.main.bundleIdentifier!)
    /// レスポンスのデコーダー
    public let decoder: SPDecoder = SPDecoder()

    /// ログインしているアカウント
    public var account: UserInfo? {
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
        super.init()
    }

    /// クラウドにログ保存
    convenience public init(appId: String, appSecret: String, encryptionKey: String) {
        self.init()
        let cloud: SBPlatformDestination = SBPlatformDestination(appID: appId, appSecret: appSecret, encryptionKey: encryptionKey)
        self.logger.addDestination(cloud)
    }

    /// 文字列をダウンロード
    open func download<T: RequestType>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> String {
        try await self.request(request, interceptor: interceptor)
            .validationWithNXError()
            .serializingString(encoding: .utf8)
            .value
    }

    open func publish<T: RequestType>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> T.ResponseType {
        try await self.request(request, interceptor: interceptor)
            .validationWithNXError()
            .serializingDecodable(T.ResponseType.self, decoder: decoder)
            .value
    }

    /// セッショントークン取得
    private func getSessionToken(code: String, verifier: String) async throws -> SessionToken.Response {
        let request: SessionToken = SessionToken(code: code, verifier: verifier)
        return try await publish(request)
    }

    /// アクセストークン取得
    private func getAccessToken(sessionToken: String) async throws -> AccessToken.Response {
        let request: AccessToken = AccessToken(sessionToken: sessionToken)
        return try await publish(request)
    }

    /// ハッシュ取得
    private func getHash(accessToken: AccessToken.Response) async throws -> Imink.Response {
        do {
            let request: Imink = Imink(accessToken: accessToken, server: .Imink)
            return try await publish(request)
        } catch {
            let request: Imink = Imink(accessToken: accessToken, server: .Flapg)
            return try await publish(request)
        }
    }

    /// ハッシュ取得
    private func getHash(accessToken: GameServiceToken.Response) async throws -> Imink.Response {
        do {
            let request: Imink = Imink(accessToken: accessToken, server: .Imink)
            return try await publish(request)
        } catch {
            let request: Imink = Imink(accessToken: accessToken, server: .Flapg)
            return try await publish(request)
        }
    }

    /// バージョン取得
    private func getVersion() async throws -> Version.Response {
        let request: Version = Version()
        return Version.Response(from: try await download(request))
    }

    /// ゲームバージョン取得
    private func getWebVersion() async throws -> WebVersion.Response {
        let request: WebVersion = WebVersion()
        return WebVersion.Response(from: try await download(request))
    }

    /// トークン取得
    private func getGameServiceToken(accessToken: AccessToken.Response, version: Version.Response) async throws -> GameServiceToken.Response {
        let response: Imink.Response = try await getHash(accessToken: accessToken)
        let request: GameServiceToken = GameServiceToken(imink: response, accessToken: accessToken, version: version)
        return try await publish(request)
    }

    /// トークン取得
    func getGameWebToken(accessToken: GameServiceToken.Response, version: Version.Response, contentId: ContentId) async throws -> GameWebToken.Response {
        let response: Imink.Response = try await getHash(accessToken: accessToken)
        let request: GameWebToken = GameWebToken(imink: response, accessToken: accessToken, version: version.version, contentId: .SP3)
        return try await publish(request)
    }

    /// トークン取得
    private func getBulletToken(gameWebToken: String, version: WebVersion.Response) async throws -> BulletToken.Response {
        let request: BulletToken = BulletToken(accessToken: gameWebToken, version: version)
        return try await publish(request)
    }

    /// リフレッシュする
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

    /// SessionTokenCodeとVerifierからトークンを生成
    @discardableResult
    internal func getCookie(code: String, verifier: String) async throws -> UserInfo {
        let sessionToken: SessionToken.Response = try await getSessionToken(code: code, verifier: verifier)
        return try await getBulletToken(sessionToken: sessionToken.sessionToken)
    }

    /// SessionTokenからトークンを生成
    @discardableResult
    func getBulletToken(sessionToken: String) async throws -> UserInfo {
        logger.debug("Get Bullet Token: with Session Token")
        let accessToken: AccessToken.Response = try await self.getAccessToken(sessionToken: sessionToken)
        let version: Version.Response = try await self.getVersion()
        let gameServiceToken: GameServiceToken.Response =  try await self.getGameServiceToken(accessToken: accessToken, version: version)
        let gameWebToken: GameWebToken.Response = try await self.getGameWebToken(accessToken: gameServiceToken, version: version, contentId: .SP3)
        let webVersion: WebVersion.Response = try await self.getWebVersion()
        let bulletToken: BulletToken.Response = try await self.getBulletToken(gameWebToken: gameWebToken.result.accessToken, version: webVersion)
        let account: UserInfo = UserInfo(sessionToken: sessionToken, gameServiceToken: gameServiceToken, gameWebToken: gameWebToken, bulletToken: bulletToken)
        /// アカウント情報を保存
        self.account = account
        return account
    }
}
