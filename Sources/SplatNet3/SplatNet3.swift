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

    public init() {
        self.account =  keychain.get().first
    }

    public init(account: UserInfo) {
        self.account = account
    }

    open func authorize<T: RequestType>(_ request: T) async throws -> T.ResponseType {
        return try await session.request(request)
            .cURLDescription(calling: { request in
                #if DEBUG
                print(request)
                #endif
            })
            .validationWithNXError()
            .serializingDecodable(T.ResponseType.self, decoder: decoder)
            .value
    }

    open func request(_ request: WebVersion) async throws -> WebVersion.Response {
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
    }

    /// 概要取得
    open func getCoopSummary() async throws -> CoopSummary.Response {
        let request: CoopSummary = CoopSummary()
        return try await publish(request)
    }

    /// リザルト取得
    open func getCoopResult(id: String) async throws -> SplatNet2.Result {
        let request: CoopResult = CoopResult(id: id)
        let result: CoopResult.Response = try await publish(request)
        return result.asSplatNet2()
    }

    /// リザルト全件取得
    open func getCoopResultIds(resultId: String? = nil) async throws -> [String] {
        let summary: CoopSummary.Response = try await getCoopSummary()

        //
        let ids: [String] = summary.data.coopResult.historyGroups.nodes.flatMap({ node in node.historyDetails.nodes.map({ $0.id }) })

        // リザルトIDが指定されていれば、そのIDよりも大きい値を返す
        if let resultId = resultId {
            return ids.filter({ $0.playTime > resultId.playTime })
        }
        return ids
    }
}

public extension String {
    var playTime: Int {
        let formatter: ISO8601DateFormatter = {
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [
                .withDay,
                .withMonth,
                .withYear,
                .withTime,
            ]
            return formatter
        }()
        if let playTime: String = self.base64DecodedString.capture(pattern: #":(\d{8}T\d{6})_"#, group: 1),
           let timeInterval: TimeInterval = formatter.date(from: playTime)?.timeIntervalSince1970 {
            return Int(timeInterval)
        }
        return 0
    }
}

extension SplatNet3 {
    /// バージョン書き込み
    public func setVersion(version: WebVersion.Response) throws {
        try keychain.setVersion(version)
    }

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
