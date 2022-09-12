//
//  SplatNet3+Publisher.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/03.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Foundation
import Common
import Alamofire

extension SplatNet3 {
    /// Async/Awaitリクエスト
    public func publish<T: RequestType>(_ request: T) async throws -> T.ResponseType {
        // 選択されているアカウントから認証情報を取得
        let credential: OAuthCredential = try {
            guard let account = account else {
                throw AFError.responseValidationFailed(reason: .customValidationFailed(error: NXError.API.account))
            }
            return account.credential
        }()

        // インターセプターを生成
        let interceptor: AuthenticationInterceptor<SplatNet3> = AuthenticationInterceptor(authenticator: self, credential: credential)

        /// インターセプターを利用してリクエスト
        return try await session.request(request, interceptor: interceptor)
            .cURLDescription(calling: { request in
#if DEBUG
                print(request)
#endif
            })
            .validationWithNXError()
            .serializingDecodable(T.ResponseType.self, decoder: decoder)
            .value
    }

}
