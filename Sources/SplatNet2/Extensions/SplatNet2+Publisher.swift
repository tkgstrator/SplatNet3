//
//  SplatNet2+Publisher.swift
//  SplatNet2
//
//  Created by tkgstrator on 2022/09/03.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Foundation
import Common
import Alamofire

extension SplatNet2 {
    /// イカスミセッション取得用
    internal func generate(_ request: IksmSession) async throws -> IksmSession.Response {
        let dataRequest: DataRequest = session
            .request(request)
            .validate()
            .validate(contentType: ["text/html"])
        let body: String = try await dataRequest.serializingString().value
        guard let response: HTTPURLResponse = dataRequest.response,
              let nsaid: String = body.capture(pattern: "data-nsa-id=([/0-f/]{16})", group: 1),
              let header: [String: String] = response.allHeaderFields as? [String: String],
              let url: URL = response.url,
              let iksmSession: String = HTTPCookie.cookies(withResponseHeaderFields: header, for: url).first?.value
        else {
            throw Failure.API(error: NXError.API.content)
        }
        return IksmSession.Response(iksmSession: iksmSession, nsaid: nsaid)
    }

    /// Async/Awaitリクエスト
    public func publish<T: RequestType>(_ request: T) async throws -> T.ResponseType {
        // 選択されているアカウントから認証情報を取得
        let credential: OAuthCredential = try {
            guard let account = account else {
                throw Failure.API(error: NXError.API.account)
            }
            return account.credential
        }()

        // インターセプターを生成
        let interceptor: AuthenticationInterceptor<SplatNet2> = AuthenticationInterceptor(authenticator: self, credential: credential)

        /// インターセプターを利用してリクエスト
        return try await session.request(request, interceptor: interceptor)
            .cURLDescription()
            .validationWithNXError()
            .serializingDecodable(T.ResponseType.self, decoder: decoder)
            .value
    }

}
