//
//  OAuthAuthenticator.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Combine
import Common
import KeychainAccess
import Foundation

open class SplatNet2: Authenticator {

    /// デバッグ用のアカウントで認証したインスタンス
    public init(account: UserInfo? = nil) {
        self.account = account
    }

    public init() {}

    public var account: UserInfo? = nil

    internal let keychain: Keychain = Keychain(service: "SPLATNET2")

    internal let decoder: JSONDecoder = {
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    /// セッション
    public let session: Session = {
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            config.httpMaximumConnectionsPerHost = 1
            config.timeoutIntervalForRequest = 15
            return config
        }()
        let queue = DispatchQueue(label: "SplatNet2")
        return Session(configuration: configuration, rootQueue: queue, requestQueue: queue)
    }()

    /// リクエストが正しく送られたかどうか
    public func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
        return response.statusCode == 403
    }

    /// リクエストが失敗したときにリトライするかどうか
    public func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: OAuthCredential) -> Bool {
        return false
    }

    public func apply(_ credential: OAuthCredential, to urlRequest: inout URLRequest) {
        print("Current Time", Date())
        print("Expires Time", credential.expiration)
        print("Is Available", credential.requiresRefresh)
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
            throw AFError.responseValidationFailed(reason: .customValidationFailed(error: NXError.API.response))
        }
        return IksmSession.Response(iksmSession: iksmSession, nsaid: nsaid)
    }

    public func publish<T: RequestType>(_ request: T) async throws -> T.ResponseType {
        // 選択されているアカウントから認証情報を取得
        let credential: OAuthCredential = try {
            guard let account = account else {
                throw AFError.responseValidationFailed(reason: .customValidationFailed(error: NXError.API.account))
            }
            return account.credential
        }()

        // インターセプターを生成
        let interceptor: AuthenticationInterceptor<SplatNet2> = AuthenticationInterceptor(authenticator: self, credential: credential)

        /// インターセプターを利用してリクエスト
        return try await session.request(request, interceptor: interceptor)
            .cURLDescription(calling: { request in
#if DEBUG
                print(request)
#endif
            })
            .validationWithSP2Error()
            .serializingDecodable(T.ResponseType.self, decoder: decoder)
            .value
    }

    /// 概要取得
    internal func getCoopSummary() async throws -> Results.Response {
        let request: Results = Results()
        return try await publish(request)
    }

    /// リザルト取得
    internal func getCoopResult(resultId: Int) async throws -> CoopResult.Response {
        let request: CoopResult = CoopResult(resultId: resultId)
        return try await publish(request)
    }
}
