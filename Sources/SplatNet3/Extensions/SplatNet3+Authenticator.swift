//
//  SplatNet3+Authenticator.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Common
import Alamofire

extension SplatNet3 {
    /// リクエストが正しく送られたかどうか
    public func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
        return response.statusCode == 401
    }

    /// リクエストが失敗したときにリトライするかどうか
    public func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: SPCredential) -> Bool {
        return false
    }

    public func apply(_ credential: SPCredential, to urlRequest: inout URLRequest) {
        // トークンを設定
        urlRequest.headers.add(.authorization(bearerToken: credential.bulletToken ?? ""))
        urlRequest.headers.add(.init(name: "X-Web-View-Ver", value: version))
    }

    public func refresh(_ credential: SPCredential, for session: Session, completion: @escaping (Swift.Result<SPCredential, Error>) -> Void) {
        Task { [weak self] in
            do {
                let response: UserInfo = try await {
                    if credential.requiresGameWebTokenRefresh {
                        return try await refreshToken(sessionToken: credential.sessionToken)
                    }
                    return try await refreshTokenByGameWebToken(gameWebToken: credential.gameWebToken)
                }()
                // アカウント情報を上書きする
                account = response
                // アカウント情報を書き込みする
                try set(response)
                completion(.success(response.credential))
            } catch(let error) {
                completion(.failure(error))
            }
        }
    }

}
