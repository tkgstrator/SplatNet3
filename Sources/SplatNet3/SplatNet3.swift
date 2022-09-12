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

public class SplatNet3: Authenticator {
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

    public init() {}

    public init(account: UserInfo) {
        self.account = account
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
