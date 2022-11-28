//
//  JsonWebToken.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.

import Foundation

/// JSONWebToken
struct JSONWebToken: Codable {
    /// Base64でエンコードされたトークンから生成
    init(gameWebToken: String) throws {
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

        let decoder: SPDecoder = SPDecoder()
        self.header = try decoder.decode(Header.self, from: data[0])
        self.payload = try decoder.decode(Payload.self, from: data[1])
    }

    let header: Header
    let payload: Payload

    enum Status: CaseIterable {
        case Valid
        case Expired
    }

    var status: Status {
        payload.exp <= Int(Date().timeIntervalSince1970) ? .Expired : .Valid
    }

    struct Header: Codable {
        let typ: String
        let alg: String
        let kid: String
        let jku: String
    }

    struct Payload: Codable {
        let isChildRestricted: Bool
        let aud: String
        let exp: Int
        let iat: Int
        let iss: String
        let jti: String
        let sub: Int64
        let links: Link
        let typ: String
        let membership: Membership
    }

    struct Link: Codable {
        let networkServiceAccount: NetworkService
    }

    struct NetworkService: Codable {
        let id: String
    }

    struct Membership: Codable {
        let active: Bool
    }
}
