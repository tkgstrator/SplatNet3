//
//  SplatNet3.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/08/13.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire
import Common
import KeychainAccess
import SwiftyBeaver

open class SplatNet3: Authenticator {
    /// SwiftyBeaverのログ管理
    internal let logger: SwiftyBeaver.Type = SwiftyBeaver.self
    /// ローカルファイルに保存
    internal let local: FileDestination = FileDestination()

    /// 利用しているアカウント
    public var account: UserInfo? = nil

    /// 利用しているKeychain
    internal let keychain: Keychain = Keychain(service: "SPLATNET")

    /// JSONDecoder
    internal let decoder: JSONDecoder = {
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    /// セッション
    public let session: Session = {
        /// 五秒でタイムアウトするようにする(将来的に長くするかも)
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            config.httpMaximumConnectionsPerHost = 1
            config.timeoutIntervalForRequest = 5
            return config
        }()
        let queue = DispatchQueue(label: "SPLATNET3")
        return Session(configuration: configuration, rootQueue: queue, requestQueue: queue)
    }()

    /// WebVersion(ヘッダーに利用されるがどのように使われるのかは不明)
    public var version: String {
        get {
            let version: WebVersion.Response = keychain.getVersion()
            return "\(version.version)-\(version.hash)"
        }

        set {
            let version: WebVersion.Response = WebVersion.Response(rawValue: newValue)
            try? keychain.setVersion(version)
        }
    }

    /// エラーログをローカルに保存する
    public init() {
        self.account =  keychain.get().first
    }

    /// エラーログをローカルとクラウドに保存する
    /// SwiftyBeaverのキーを利用する
    public init(appId: String, appSecret: String, encryptionKey: String) {
        self.account =  keychain.get().first
        /// クラウドにエラーを保存
        let cloud = SBPlatformDestination(appID: appId, appSecret: appSecret, encryptionKey: encryptionKey)
        self.logger.addDestination(cloud)
    }

    /// アカウントを利用して初期化
    public init(account: UserInfo) {
        self.account = account
    }

    /// サーモンラン概要取得
    open func getCoopSummary() async throws -> CoopSummary.Response {
        let request: CoopSummary = CoopSummary()
        return try await publish(request)
    }

    /// サーモンランリザルト取得
    open func getCoopResult(id: String) async throws -> SplatNet2.Result {
        let request: CoopResult = CoopResult(id: id)
        let result: CoopResult.Response = try await publish(request)
        return result.asSplatNet2()
    }

    /// サーモンランリザルト全件取得
    open func getCoopResultIds(resultId: String? = nil) async throws -> [String] {
        let summary: CoopSummary.Response = try await getCoopSummary()

        // 全件のIDを取得する
        let ids: [String] = summary.data.coopResult.historyGroups.nodes.flatMap({ node in node.historyDetails.nodes.map({ $0.id }) })

        // リザルトIDが指定されていれば、そのIDよりも大きい値を返す
        // 新しいリザルトしか取得しない
        if let resultId = resultId {
            return ids.filter({ $0.playTime > resultId.playTime })
        }
        return ids
    }

    /// 認証のプロセス
    open func authorize<T: RequestType>(_ request: T) async throws -> T.ResponseType {
        do {
            return try await session.request(request)
                .cURLDescription(calling: { request in
                    #if DEBUG
                    print(request)
                    #endif
                })
                .validationWithNXError()
                .serializingDecodable(T.ResponseType.self, decoder: decoder)
                .value
        } catch(let error) {
            if let failure: Error = error.asAFError?.underlyingError, let code: Int = (failure as? NSError)?.code {
                // エラーコード1001はタイムアウトなので再送する意味がない
                if code == -1001 {
                    logger.error(error.localizedDescription)
                    throw error
                }
                // エラーが発生したらとりあえずJSONSerializationで変換してデータ送信
                let data: Data = try await session.request(request)
                    .validationWithNXError()
                    .serializingData()
                    .value
                if let response = String(data: data, encoding: .utf8) {
                    logger.warning(response)
                }
                logger.error(error.localizedDescription)
                throw error
            }
            throw error
        }
    }

    /// リクエストのプロセス
    open func request(_ request: WebVersion) async throws -> WebVersion.Response {
        do {
        let response: String = try await session.request(request)
            .cURLDescription(calling: { request in
                #if DEBUG
                print(request)
                #endif
            })
            .validationWithNXError()
            .serializingString()
            .value
        return WebVersion.Response(from: response)
        } catch(let error) {
            // エラーが発生したらとりあえずJSONSerializationで変換してデータ送信
            let data: Data = try await session.request(request)
                .validationWithNXError()
                .serializingData()
                .value
            if let response = String(data: data, encoding: .utf8) {
                logger.warning(response)
            }
            logger.error(error.localizedDescription)
            throw error
        }
    }

    /// イカリング3のリクエスト
    open func publish<T: RequestType>(_ request: T) async throws -> T.ResponseType {
        // 選択されているアカウントから認証情報を取得
        let credential: OAuthCredential = try {
            guard let account = account else {
                // アカウントがセットされていなければKeychianから読み込む
                if let account = keychain.get().first {
                    // 読み込んだものをセットする
                    self.account = account
                    // 認証情報を返す
                    return account.credential
                }
                // アカウントが登録されていなければエラーを返す
                throw Failure.API(error: NXError.API.account)
            }
            return account.credential
        }()

        // インターセプターを生成
        let interceptor: AuthenticationInterceptor<SplatNet3> = AuthenticationInterceptor(authenticator: self, credential: credential)

        do {
            /// インターセプターを利用してリクエスト
            return try await session.request(request, interceptor: interceptor)
                .cURLDescription(calling: { request in
    #if DEBUG
                    print(request)
    #endif
                })
                .validationWithNXError()
                .serializingDecodable(T.ResponseType.self, decoder: decoder)
                .value
        } catch(let error) {
            // エラーが発生したらとりあえずJSONSerializationで変換してデータ送信
            let data: Data = try await session.request(request, interceptor: interceptor)
                .validationWithNXError()
                .serializingData()
                .value
            if let response = String(data: data, encoding: .utf8) {
                logger.warning(response)
            }
            logger.error(error.localizedDescription)
            throw error
        }
    }
}
