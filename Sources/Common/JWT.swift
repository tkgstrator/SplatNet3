//
//  JsonWebToken.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.

import Foundation

public struct JWT: Codable {
    /// Base64でエンコードされたトークンから生成
    public init(gameWebToken: String) throws {
        let rawTexts: [String] = gameWebToken.components(separatedBy: ".").compactMap({ $0.base64DecodedString })

        // 二つに分割できなければ不正なJWTとみなす
        // 署名の部分はBase64で復号しても文字列ではないのでデコード不可
        if rawTexts.count != 2 {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid JWT format."))
        }

        // データ型に変換
        let data: [Data] = rawTexts.compactMap({ $0.data(using: .utf8) })

        // 二つに分割できなければ不正なJWTとみなす
        if data.count != 2 {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid JWT format."))
        }

        let decoder: JSONDecoder = JSONDecoder()

        self.header = try decoder.decode(Header.self, from: data[0])
        self.payload = try decoder.decode(Payload.self, from: data[1])
    }

    public let header: Header
    public let payload: Payload

    public enum Status: CaseIterable {
        case Valid
        case Expired
    }

    public var status: Status {
        payload.exp <= Int(Date().timeIntervalSince1970) ? .Expired : .Valid
    }

    public struct Header: Codable {
        public let typ: String
        public let alg: String
        public let kid: String
        public let jku: String
    }

    public struct Payload: Codable {
        public let isChildRestricted: Bool
        public let aud: String
        public let exp: Int
        public let iat: Int
        public let iss: String
        public let jti: String
        public let sub: Int64
        public let links: Link
        public let typ: String
        public let membership: Membership
    }

    public struct Link: Codable {
        public let networkServiceAccount: NetworkService
    }

    public struct NetworkService: Codable {
        public let id: String
    }

    public struct Membership: Codable {
        public let active: Bool
    }
}
