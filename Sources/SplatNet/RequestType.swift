//
//  RequestType.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.

import Alamofire
import Foundation

public protocol RequestType: URLRequestConvertible {
    associatedtype ResponseType: Codable
    /// メソッド
    var method: HTTPMethod { get }
    /// パラメーター
    var parameters: Parameters? { get }
    /// パス
    var path: String { get }
    //  swiftlint:disable:next discouraged_optional_collection
    /// ヘッダー
    var headers: [String: String]? { get }
    /// 基本となるURL
    var baseURL: URL { get }
    /// エンコーディング方式
    var encoding: ParameterEncoding { get }
}

public extension RequestType {
    /// パラメータのエンコード方式
    var encoding: ParameterEncoding {
        JSONEncoding.default
    }

    /// URLリクエストに変換する
    func asURLRequest() throws -> URLRequest {
        // swiftlint:disable:next force_unwrapping
        let url: URL = URL(unsafeString: baseURL.appendingPathComponent(path).absoluteString.removingPercentEncoding!)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10)
        request.allHTTPHeaderFields = headers
        // UAを設定
        request.headers.update(.userAgent("SplatNet3/@tkgling"))
        // パラメータが設定されていればエンコードして設定する
        if let params = parameters {
            return try encoding.encode(request, with: params)
        }
        return request
    }
}

