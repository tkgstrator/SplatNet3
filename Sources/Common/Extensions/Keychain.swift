//
//  Keychain.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import KeychainAccess

extension Keychain {
    static let bundleIdentifier: String = "SPLATNET_ACCOUNTS"

    func set(_ account: UserInfo?) {
        if let account = account {
            try? set(try account.asData(), key: Keychain.bundleIdentifier)
        }
    }

    func get() -> UserInfo? {
        let decoder: JSONDecoder = {
            let decoder: JSONDecoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()

        guard let data: Data = try? getData(Keychain.bundleIdentifier) else {
            return nil
        }
        do {
            print(try JSONSerialization.jsonObject(with: data))
            return try decoder.decode(UserInfo.self, from: data)
        } catch (let error) {
            print(error)
            return nil
        }
    }
}
