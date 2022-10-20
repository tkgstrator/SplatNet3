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
            config.timeoutIntervalForRequest = 30
            return config
        }()
        return Session(configuration: configuration, rootQueue: .main, requestQueue: .main)
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

    /// レギュラースケジュール一括取得
    public func getAllCoopSchedule() async throws -> [CoopSchedule.Response] {
        return try await request(CoopSchedule())
    }

    /// レギュラースケジュール取得
    public func getCoopSchedule() async throws -> [CoopSchedule.Response] {
        let request: StageSchedule = StageSchedule()
        return (try await publish(request)).data.coopGroupingSchedule.regularSchedules.nodes.map({ $0.asSplatNet2() })
    }

    /// サーモンラン概要取得
    open func getCoopHistory() async throws -> CoopHistory.Response {
        let request: CoopHistory = CoopHistory()
        return try await publish(request)
    }

    /// サーモンランリザルト取得
    open func getCoopResult(element: CoopHistoryElement) async throws -> SplatNet2.Result {
        let request: CoopHistoryDetail = CoopHistoryDetail(id: element.id)
        let result: CoopHistoryDetail.Response = try await publish(request)
        return result.asSplatNet2(schedule: element)
    }

    /// サーモンランリザルト一覧をプレイ時間でソートして取得
    open func getCoopResultIds(resultId: String? = nil) async throws -> [CoopHistoryElement] {
        /// リザルト一覧取得
        let summary: CoopHistory.Response = try await getCoopHistory()

        // 全件のIDを取得する
        let historyGroups: [CoopHistory.HistoryGroupsNode] = summary.data.coopResult.historyGroups.nodes

        // リザルトIDが指定されていれば、そのIDよりも大きい値を返す
        // 新しいリザルトしか取得しない
        if let resultId = resultId {
            return historyGroups.map({ group -> CoopHistory.HistoryGroupsNode in
                var historyGroup: CoopHistory.HistoryGroupsNode = group
                historyGroup.historyDetails.nodes = group.historyDetails.nodes.filter({ $0.id.playTime > resultId.playTime })
                return historyGroup
            }).asElement().sorted(by: { $0.id.playTime < $1.id.playTime })
        }
        return historyGroups.asElement().sorted(by: { $0.id.playTime < $1.id.playTime })
    }

    /// 認証のプロセス
    open func authorize<T: RequestType>(_ request: T) async throws -> T.ResponseType {
        do {
            return try await session.request(request)
                .cURLDescription()
                .validationWithNXError()
                .serializingDecodable(T.ResponseType.self, decoder: decoder)
                .value
        } catch(let error) {
            if let failure: Error = error.asAFError?.underlyingError {
                let code: Int = (failure as NSError).code
                // エラーコード1001はタイムアウトなので再送する意味がない
                if code == -1001 {
                    logger.error(error.localizedDescription)
                    throw error
                }
            }

            // エラーが発生したらとりあえずJSONSerializationで変換してデータ送信
            let data: Data = try await session.request(request)
                .serializingData()
                .value
            if let response = String(data: data, encoding: .utf8) {
                logger.warning(response)
            }
            logger.error(error.localizedDescription)
            throw error
        }
    }

    /// バージョンのプロセス
    open func request(_ request: Version) async throws -> Version.Response {
        do {
            let response: String = try await session.request(request)
                .cURLDescription()
                .validationWithNXError()
                .serializingString()
                .value
            return Version.Response(from: response)
        } catch(let error) {
            throw error
        }
    }

    /// スケジュールのプロセス
    open func request(_ request: CoopSchedule) async throws -> [CoopSchedule.Response] {
        do {
            /// インターセプターを利用せずリクエスト
            return try await session.request(request)
                .cURLDescription()
                .validationWithNXError()
                .serializingDecodable([CoopSchedule.Response].self, decoder: decoder)
                .value
        } catch(let error) {
            if let failure: Error = error.asAFError?.underlyingError {
                let code: Int = (failure as NSError).code
                // エラーコード1001はタイムアウトなので再送する意味がない
                if code == -1001 {
                    logger.error(error.localizedDescription)
                    throw error
                }

                // エラーが発生したらとりあえずJSONSerializationで変換してデータ送信
                let data: Data = try await session.request(request)
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
                .cURLDescription()
                .validationWithNXError()
                .serializingString()
                .value
            return WebVersion.Response(from: response)
        } catch(let error) {
            if let failure: Error = error.asAFError?.underlyingError {
                let code: Int = (failure as NSError).code
                // エラーコード1001はタイムアウトなので再送する意味がない
                if code == -1001 {
                    logger.error(error.localizedDescription)
                    throw error
                }

                // エラーが発生したらとりあえずJSONSerializationで変換してデータ送信
                let data: Data = try await session.request(request)
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

    /// イカリング3のリクエスト
    open func publish<T: GraphQL>(_ request: T) async throws -> T.ResponseType {
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
                .cURLDescription()
                .validationWithNXError()
                .serializingDecodable(T.ResponseType.self, decoder: decoder)
                .value
        } catch(let error) {
            if let failure: Error = error.asAFError?.underlyingError {
                let code: Int = (failure as NSError).code
                // エラーコード1001はタイムアウトなので再送する意味がない
                if code == -1001 {
                    logger.error(error.localizedDescription)
                    throw error
                }

                // エラーが発生したらとりあえずJSONSerializationで変換してデータ送信
                let data: Data = try await session.request(request)
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
}
