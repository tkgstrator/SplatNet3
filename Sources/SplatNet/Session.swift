//
//  Session.swift
//  
//
//  Created by devonly on 2022/11/28.
//  
//

import Foundation
import Alamofire

open class SPSession: RequestInterceptor {
    let session: Alamofire.Session = {
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.httpCookieAcceptPolicy = .never
        configuration.allowsCellularAccess = true
        return Alamofire.Session(configuration: configuration)
    }()
    let decoder: SPDecoder = SPDecoder()

    open func request<T: RequestType>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> T.ResponseType {
        try await session.request(request, interceptor: interceptor)
            .serializingDecodable(T.ResponseType.self, decoder: decoder)
            .value
    }

    open func request<T: RequestType>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> String {
        try await session.request(request, interceptor: interceptor)
            .serializingString(encoding: .utf8)
            .value
    }

    open func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(request.retryCount == 0 ? .retry : .doNotRetry)
    }
}

extension SPSession {
    func getSessionToken(code: String, verifier: String) async throws -> SessionToken.Response {
        try await request(SessionToken(code: code, verifier: verifier))
    }

    func getAccessToken(sessionToken: String) async throws -> AccessToken.Response {
        try await request(AccessToken(sessionToken: sessionToken))
    }

    func getHash(accessToken: AccessToken.Response) async throws -> Imink.Response {
        do {
            return try await request(Imink(accessToken: accessToken, server: .Flapg))
        } catch {
            return try await request(Imink(accessToken: accessToken, server: .Imink), interceptor: self)
        }
    }

    func getHash(accessToken: GameServiceToken.Response) async throws -> Imink.Response {
        do {
            return try await request(Imink(accessToken: accessToken, server: .Flapg))
        } catch {
            return try await request(Imink(accessToken: accessToken, server: .Imink), interceptor: self)
        }
    }

    func getXVersion() async throws -> XVersion.Response {
        let response: String = try await request(XVersion())
        return XVersion.Response(context: response)
    }

    func getWebVersion() async throws -> WebVersion.Response {
        let response: String = try await request(WebVersion())
        return WebVersion.Response(context: response)
    }

    func getGameServiceToken(accessToken: AccessToken.Response, version: XVersion.Response) async throws -> GameServiceToken.Response {
        let response : Imink.Response = try await getHash(accessToken: accessToken)
        return try await request(GameServiceToken(imink: response, accessToken: accessToken, version: version))
    }

    func getGameWebToken(accessToken: GameServiceToken.Response, version: XVersion.Response, contentId: ContentId) async throws -> GameWebToken.Response {
        let response : Imink.Response = try await getHash(accessToken: accessToken)
        return try await request(GameWebToken(imink: response, accessToken: accessToken, contentId: contentId))
    }

    func getBulletToken(gameWebToken: GameWebToken.Response) async throws -> BulletToken.Response {
        let response: WebVersion.Response = try await request(WebVersion())
        return try await request(BulletToken(accessToken: gameWebToken.result.accessToken, version: response))

    }

    func refresh(code: String, verifier: String) async throws {
        let sessionToken: SessionToken.Response = try await getSessionToken(code: code, verifier: verifier)
        try await refresh(sessionToken: sessionToken.sessionToken)
    }

    func refresh(sessionToken: String) async throws {
        let accessToken: AccessToken.Response = try await getAccessToken(sessionToken: sessionToken)
        let version: XVersion.Response = try await getXVersion()
        let gameServiceToken: GameServiceToken.Response = try await getGameServiceToken(accessToken: accessToken, version: version)
        let gameWebToken: GameWebToken.Response = try await getGameWebToken(accessToken: gameServiceToken, version: version, contentId: .SP3)
        let bulletToken: BulletToken.Response = try await getBulletToken(gameWebToken: gameWebToken)
        print(bulletToken)
    }
}
