//
//  NXError.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

enum NXError: String, CaseIterable, Codable {
    /// リクエストの内容が誤っている
    case INVALID_REQUEST    = "invalid_request"
    /// 権限が誤っている
    case INVALID_GRANT      = "invalid_grant"
    /// クライアントIDが誤っている
    case INVALID_CLIENT     = "invalid_client"
}

enum NXErrorDescription: String, CaseIterable, Codable {
    /// リクエストの内容が誤っている
    case BAD_REQUEST    = "The request does not satisfy the schema"
    /// トークンコードが有効期限切れ
    case TOKEN_EXPIRED  = "The provided session_token_code is expired"
    /// トークンコードが誤っている
    case TOKEN_INVALID  = "The provided session_token_code is invalid"
    /// 正しい権限が与えられていない
    case INVALID_GRANT  = "The provided grant is invalid"
    /// クライアントIDが誤っている
    case OAUTH_FAILED   = "Client authentication failed"
}

enum NXErrorMessage:  String, CaseIterable, Codable {
    /// リクエストが誤っている
    case BAD_REQUEST        = "Bad request."
    /// 要求されているバージョンよりも低い
    case UPGRADE_REQUIRED   = "Upgrade required."
    /// 有効でないトークンが使われている
    case INVALID_TOKEN      = "Invalid token."
    /// トークンの有効期限が切れている
    case TOKEN_EXPIRED      = "Token expired."
    /// 認証されていないトークンが使われている
    case UNAUTHORIZED       = "Unauthorized."
    /// パラメータfのタイムスタンプがズレている
    case UNEXPECTED         = "Unexpected Error."
    /// ニンテンドースイッチオンラインに加入していない
    case MEMBERSHIP         = "Membership required error."
}
