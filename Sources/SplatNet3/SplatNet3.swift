//
//  SplatNet3.swift
//  
//
//  Created by devonly on 2022/08/18.
//

import Foundation
import Alamofire
import Common
import KeychainAccess

public class SplatNet3: Authenticator {
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
        let queue = DispatchQueue(label: "SplatNet2")
        return Session(configuration: configuration, rootQueue: queue, requestQueue: queue)
    }()

    public let version: String = "1.0.0-5e2bcdfb"

    public init() {}
}
