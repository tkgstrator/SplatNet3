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

open class SplatNet3: Authenticator {
    public var account: UserInfo? = nil

    private let keychain: Keychain = Keychain(service: "SPLATNET")

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
        let queue = DispatchQueue(label: "SPLATNET3")
        return Session(configuration: configuration, rootQueue: queue, requestQueue: queue)
    }()

    public let version: String = "1.0.0-5e2bcdfb"

    public init() {
        let accounts: [UserInfo] = keychain.get()
        if !accounts.isEmpty {
            print(accounts.count)
            self.account = accounts.first
        }
    }

    public init(account: UserInfo) {
        self.account = account
    }

    /// リザルト取得
    open func getCoopResult(id: String) async throws -> SplatNet2.Result {
        let request: CoopResult = CoopResult(id: id)
        let result: CoopResult.Response = try await publish(request)
        return result.asSplatNet2()
    }

    /// リザルト全件取得
    open func getCoopResults() async throws -> [SplatNet2.Result] {
        let summary: CoopSummary.Response = try await getCoopSummary()
        let ids: [String] = summary.data.coopResult.historyGroups.nodes.flatMap({ node in node.historyDetails.nodes.map({ $0.id }) })
        let results: [SplatNet2.Result] = try await ids.asyncMap({ (try await publish(CoopResult(id: $0))).asSplatNet2() })
        return results
    }
}

extension SplatNet3 {
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
