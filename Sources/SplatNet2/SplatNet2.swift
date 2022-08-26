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

    init() {}

    public let account: UserInfo? = nil

    private let keychain: Keychain = Keychain(service: Bundle.main.bundleIdentifier!)

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
            config.timeoutIntervalForRequest = 10
            return config
        }()
        let queue = DispatchQueue(label: "SplatNet2")
        return Session(configuration: configuration, rootQueue: queue, requestQueue: queue)
    }()

    public func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
        return true
    }

    public func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: OAuthCredential) -> Bool {
        return true
    }

    public func apply(_ credential: OAuthCredential, to urlRequest: inout URLRequest) {
        // イカスミセッションを設定
        urlRequest.headers.add(HTTPHeader(name: "cookie", value: "iksm_session=\(credential.iksmSession)"))
    }

    public func refresh(_ credential: OAuthCredential, for session: Session, completion: @escaping (Result<OAuthCredential, Error>) -> Void) {
        
    }

    internal func publish(_ request: IksmSession) async throws -> IksmSession.Response {
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
            throw SP2Error.responseSerializationFailed(reason: nil, statusCode: 403)
        }
        return IksmSession.Response(iksmSession: iksmSession, nsaid: nsaid)
    }

    public func publish<T: RequestType>(_ request: T) async throws -> T.ResponseType {
        guard let account = account else {
            throw SP2Error.requestAdaptionFailed(reason: "", statusCode: 401)
        }
        let interceptor: AuthenticationInterceptor<SplatNet2> = AuthenticationInterceptor(authenticator: self, credential: account.credential)

        return try await session.request(request, interceptor: interceptor)
            .cURLDescription(calling: { request in
                #if DEBUG
                print(request)
                #endif
            })
            .validationWithSP2Error()
            .serializingDecodable(T.ResponseType.self)
            .value
    }

    /// イカスミセッションをセッショントークンから取得
    internal func refreshToken() {

    }

    internal func getCookie(code: String, verifier: String) async throws -> UserInfo {
        let sessionToken: SessionToken.Response = try await getSessionToken(code: code, verifier: verifier)
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

    /// セッショントークン取得
    internal func getSessionToken(code: String, verifier: String) async throws -> SessionToken.Response {
        let request: SessionToken = SessionToken(code: code, verifier: verifier)
        return try await publish(request)
    }

    /// アクセストークン取得
    internal func getAccessToken(sessionToken: SessionToken.Response) async throws -> AccessToken.Response {
        let request: AccessToken = AccessToken(sessionToken: sessionToken)
        return try await publish(request)
    }

    /// スプラトゥーントークン取得
    internal func getSplatoonToken(accessToken: AccessToken.Response) async throws -> SplatoonToken.Response {
        let imink: Imink.Response = try await getIminkToken(accessToken: accessToken)
        let request: SplatoonToken = SplatoonToken(imink: imink, accessToken: accessToken.accessToken, version: version)
        return try await publish(request)
    }

    /// スプラトゥーンアクセストークン取得
    internal func getSplatoonAccessToken(accessToken: SplatoonToken.Response) async throws -> SplatoonAccessToken.Response {
        let imink: Imink.Response = try await getIminkToken(accessToken: accessToken)
        let request: SplatoonAccessToken = SplatoonAccessToken(imink: imink, accessToken: accessToken, version: version)
        return try await publish(request)
    }

    /// ハッシュ取得
    internal func getIminkToken(accessToken: AccessToken.Response) async throws -> Imink.Response {
        let request: Imink = Imink(accessToken: accessToken)
        return try await publish(request)
    }

    /// ハッシュ取得
    internal func getIminkToken(accessToken: SplatoonToken.Response) async throws -> Imink.Response {
        let request: Imink = Imink(accessToken: accessToken)
        return try await publish(request)
    }

    /// イカスミセッション取得
    internal func getIksmSession(accessToken: SplatoonAccessToken.Response) async throws -> IksmSession.Response {
        let request: IksmSession = IksmSession(accessToken: accessToken.result.accessToken)
        return try await publish(request)
    }
}
