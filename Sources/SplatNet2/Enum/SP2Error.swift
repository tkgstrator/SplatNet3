//
//  SP2Error.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/05/06.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

public enum SP2Error {
    public enum NSO: String, Error, Codable {
        /// リクエストの内容が誤っている
        case request = "The request does not satisfy the schema"
        /// トークンコードが有効期限切れ
        case expired = "The provided session_token_code is expired"
        /// 正しい権限が与えられていない
        case grant   = "The provided grant is invalid"
        /// クライアントIDが誤っている
        case client  = "Client authentication failed"
    }

    public enum APP: String, Error, Codable {
        /// リクエストが誤っている
        case request        = "Bad request."
        /// 要求されているバージョンよりも低い
        case version        = "Upgrade required."
        /// 有効でないトークンが使われている
        case token          = "Invalid token."
        /// トークンの有効期限が切れている
        case expired        = "Token expired."
        /// 認証されていないトークンが使われている
        case unauthorized   = "Unauthorized."
        /// パラメータfのタイムスタンプがズレている
        case unexpected     = "Unexpected Error."
    }

    public enum API: String, Error, Codable {
        /// 新しいコンテンツが存在しない
        case content        = "No contents."
        /// 有効でないレスポンス
        case response       = "Invalid response."
        /// 設定されているアカウントがない
        case account        = "No accounts."
    }
}

extension SP2Error.NSO: LocalizedError {
    public var errorDescription: String? {
        self.rawValue
    }
}

extension SP2Error.APP: LocalizedError {
    public var errorDescription: String? {
        self.rawValue
    }
}

extension SP2Error.API: LocalizedError {
    public var errorDescription: String? {
        self.rawValue
    }
}
