//
//  SplatNet2+Authenticator.swift
//  SplatNet2
//
//  Created by tkgstrator on 2022/09/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Common
import Alamofire

extension SplatNet2 {
    /// リクエストが正しく送られたかどうか
    public func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
        return response.statusCode == 403
    }

    /// リクエストが失敗したときにリトライするかどうか
    public func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: OAuthCredential) -> Bool {
        return false
    }

    public func apply(_ credential: OAuthCredential, to urlRequest: inout URLRequest) {
        // イカスミセッションを設定
        urlRequest.headers.add(HTTPHeader(name: "cookie", value: "iksm_session=\(credential.iksmSession)"))
    }

    public func refresh(_ credential: OAuthCredential, for session: Session, completion: @escaping (Swift.Result<OAuthCredential, Error>) -> Void) {
        Task { [weak self] in
            do {
                let response: UserInfo = try await refreshToken(sessionToken: credential.sessionToken)
                // アカウント情報を上書きする
                account = response
                completion(.success(response.credential))
            } catch(let error) {
                completion(.failure(error))
            }
        }
    }

}
