//
//  OAuthAuthenticator.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire
import Common
import KeychainAccess

open class SplatNet2: Authenticator {

    /// デバッグ用のアカウントで認証したインスタンス
    public init(account: UserInfo? = nil) {
        self.account = account
    }

    public init() {}

    public var account: UserInfo? = nil

    private let keychain: Keychain = Keychain(service: "SPLATNET2")

    internal let decoder: JSONDecoder = {
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    /// セッション
    public let session: Session = {
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            config.httpMaximumConnectionsPerHost = 1
            config.timeoutIntervalForRequest = 15
            return config
        }()
        let queue = DispatchQueue(label: "SPLATNET")
        return Session(configuration: configuration, rootQueue: queue, requestQueue: queue)
    }()

    /// 概要取得
    internal func getCoopSummary() async throws -> Results.Response {
        let request: Results = Results()
        return try await publish(request)
    }

    /// リザルト取得
    internal func getCoopResult(resultId: Int) async throws -> CoopResult.Response {
        let request: CoopResult = CoopResult(resultId: resultId)
        return try await publish(request)
    }
}

extension SplatNet2 {
    /// アカウント新規追加
    public func set(_ account: UserInfo) throws {
        try keychain.set(account)
    }

    /// アカウント追加
    public func add(_ account: UserInfo) throws {
        try keychain.add(account)
    }

    /// アカウント削除
    public func remove(_ account: UserInfo) throws {
    }

    /// アカウント全削除
    public func removeAll() throws {
        try keychain.removeAll()
    }

    /// アカウント
    public var accounts: [UserInfo] {
        keychain.get()
    }
}
