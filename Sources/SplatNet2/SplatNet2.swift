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

    public init() {}

    public var account: UserInfo? = nil

    internal let keychain: Keychain = Keychain(service: "SPLATNET2")

    private let decoder: JSONDecoder = {
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    public var version: String {
        get {
            keychain.version
        }
        set {}
    }

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

    public func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
        print("Did Request")
        return false
    }

    public func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: OAuthCredential) -> Bool {
        print("Is Request")
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
            throw AFError.responseValidationFailed(reason: .customValidationFailed(error: SP2Error.API.response))
        }
        return IksmSession.Response(iksmSession: iksmSession, nsaid: nsaid)
    }

    public func publish<T: RequestType>(_ request: T) async throws -> T.ResponseType {
        let credential: OAuthCredential = {
#if DEBUG
            let credential: OAuthCredential = OAuthCredential(
                nsaid: "91d160aa84e88da6",
                iksmSession: "3b78964054c63dcb76275fb2123acbf06cd74acb",
                sessionToken: "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1YzFlMmMwMjg1MjRmMDYwIiwiaWF0IjoxNjYxMzkwNjEyLCJ0eXAiOiJzZXNzaW9uX3Rva2VuIiwiZXhwIjoxNzI0NDYyNjEyLCJhdWQiOiI3MWI5NjNjMWI3YjZkMTE5Iiwic3Q6c2NwIjpbMCw4LDksMTcsMjNdLCJpc3MiOiJodHRwczovL2FjY291bnRzLm5pbnRlbmRvLmNvbSIsImp0aSI6OTYzMTY1MjQ0Mn0.A3BEP5W30CWj9Tyy4vY-IguxI1C6TLKkHItXAEa8uIs",
                splatoonToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc0NoaWxkUmVzdHJpY3RlZCI6ZmFsc2UsIm1lbWJlcnNoaXAiOnsiYWN0aXZlIjp0cnVlfSwiYXVkIjoiZjQxN2UxdGlianFkOTFjaDk5dTQ5aXd6NXNuOWNoeTMiLCJleHAiOjE2NjE2MTY5NDQsImlhdCI6MTY2MTYwOTc0NCwiaXNzIjoiYXBpLWxwMS56bmMuc3J2Lm5pbnRlbmRvLm5ldCIsInN1YiI6NjQ0NTQ1NzE2OTk3MzI0OCwidHlwIjoiaWRfdG9rZW4ifQ.951ll7aJpVJcBmbTenskx9JoOrWfKULh_wvejTRNo4g"
            )
            return credential
#else
            guard let account = account else {
                throw AFError.responseValidationFailed(reason: .customValidationFailed(error: SP2Error.API.account))
            }
            return account.credential
#endif
        }()

        let interceptor: AuthenticationInterceptor<SplatNet2> = AuthenticationInterceptor(authenticator: self, credential: credential)

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

    internal func authorize<T: RequestType>(_ request: T) async throws -> T.ResponseType {
        return try await session.request(request)
            .cURLDescription(calling: { request in
#if DEBUG
                print(request)
#endif
            })
            .validationWithSP2Error()
            .serializingDecodable(T.ResponseType.self, decoder: decoder)
            .value
    }

    /// イカスミセッションをセッショントークンから取得
    internal func refreshToken(sessionToken: String) async throws -> UserInfo {
        let accessToken: AccessToken.Response = try await getAccessToken(sessionToken: sessionToken)
        let splatoonToken: SplatoonToken.Response = try await getSplatoonToken(accessToken: accessToken)
        let splatoonAccessToken: SplatoonAccessToken.Response = try await getSplatoonAccessToken(accessToken: splatoonToken)
        let iksmSession: IksmSession.Response = try await getIksmSession(accessToken: splatoonAccessToken)

        return UserInfo(
            sessionToken: sessionToken,
            splatoonToken: splatoonToken,
            iksmSession: iksmSession
        )
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

    /// バージョンを取得
    internal func getXProductVersion() async throws -> XVersion.Response {
        let request: XVersion = XVersion()
        return try await authorize(request)
    }

    /// イカスミセッションをコードとベリファイアから取得
    internal func getCookie(code: String, verifier: String) async throws -> UserInfo {
        let sessionToken: SessionToken.Response = try await getSessionToken(code: code, verifier: verifier)
        return try await refreshToken(sessionToken: sessionToken.sessionToken)
    }

    /// セッショントークン取得
    internal func getSessionToken(code: String, verifier: String) async throws -> SessionToken.Response {
        let request: SessionToken = SessionToken(code: code, verifier: verifier)
        return try await authorize(request)
    }

    /// アクセストークン取得
    internal func getAccessToken(sessionToken: String) async throws -> AccessToken.Response {
        let request: AccessToken = AccessToken(sessionToken: sessionToken)
        return try await authorize(request)
    }

    /// アクセストークン取得
    internal func getAccessToken(sessionToken: SessionToken.Response) async throws -> AccessToken.Response {
        let request: AccessToken = AccessToken(sessionToken: sessionToken)
        return try await authorize(request)
    }

    /// スプラトゥーントークン取得
    internal func getSplatoonToken(accessToken: AccessToken.Response) async throws -> SplatoonToken.Response {
        let imink: Imink.Response = try await getIminkToken(accessToken: accessToken)
        let request: SplatoonToken = SplatoonToken(imink: imink, accessToken: accessToken.accessToken, version: version)
        return try await authorize(request)
    }

    /// スプラトゥーンアクセストークン取得
    internal func getSplatoonAccessToken(accessToken: SplatoonToken.Response) async throws -> SplatoonAccessToken.Response {
        let imink: Imink.Response = try await getIminkToken(accessToken: accessToken)
        let request: SplatoonAccessToken = SplatoonAccessToken(imink: imink, accessToken: accessToken, version: version)
        return try await authorize(request)
    }

    /// ハッシュ取得
    internal func getIminkToken(accessToken: AccessToken.Response) async throws -> Imink.Response {
        let request: Imink = Imink(accessToken: accessToken)
        return try await authorize(request)
    }

    /// ハッシュ取得
    internal func getIminkToken(accessToken: SplatoonToken.Response) async throws -> Imink.Response {
        let request: Imink = Imink(accessToken: accessToken)
        return try await authorize(request)
    }

    /// イカスミセッション取得
    internal func getIksmSession(accessToken: SplatoonAccessToken.Response) async throws -> IksmSession.Response {
        let request: IksmSession = IksmSession(accessToken: accessToken.result.accessToken)
        return try await generate(request)
    }
}
