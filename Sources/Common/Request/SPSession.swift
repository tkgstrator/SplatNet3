//
//  SPSession.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import Alamofire

open class SPSession: Authorize, Authenticator, ObservableObject {
    @Published public var requests: [SPProgress] = []

    public typealias Credential = UserInfo

    /// - Parameters:
    ///   - credential: The `Credential`.
    ///   - urlRequest: The `URLRequest`.
    public func apply(_ credential: UserInfo, to urlRequest: inout URLRequest) {
        logger.debug("Authenticator: Apply")
        if let bulletToken: String = credential.bulletToken {
            urlRequest.headers.add(.authorization(bearerToken: bulletToken))
            urlRequest.headers.add(.init(name: "X-Web-View-Ver", value: "1.0.0-433ec0e8"))
        }
    }

    /// `Authenticator` logic matches their expectations.
    ///
    /// - Parameters:
    ///   - credential: The `Credential` to refresh.
    ///   - session:    The `Session` requiring the refresh.
    ///   - completion: The closure to be executed once the refresh is complete.
    public func refresh(_ credential: UserInfo, for session: Alamofire.Session, completion: @escaping (Result<UserInfo, Error>) -> Void) {
        logger.debug("Authenticator: Refresh -> GameWebToken: \(credential.requiresGameWebTokenRefresh), BulletToken: \(credential.requiresRefresh)")
        Task {
            do {
                let account: UserInfo = try await {
                    if credential.requiresGameWebTokenRefresh {
                        return try await getBulletToken(sessionToken: credential.sessionToken)
                    }
                    return try await refreshBulletToken(gameWebToken: credential.gameWebToken)
                }()
                completion(.success(account))
            }
        }
    }

    /// - Returns: `true` if the `URLRequest` is authenticated with the `Credential`, `false` otherwise.
    public func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: UserInfo) -> Bool {
        logger.debug("Authenticator: isRequest")
        return true
    }

    /// Returns: `true` if the `URLRequest` failed due to an authentication error, `false` otherwise.
    public func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
        logger.debug("Authenticator: didRequest: URL -> \(urlRequest.headers)")
        logger.error(error.localizedDescription)
        return response.statusCode == 401
    }

    override func request<T: RequestType>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> String {
        DispatchQueue.main.async(execute: {
            self.requests.append(SPProgress(request))
        })
        do {
            let response: String = try await super.request(request, interceptor: interceptor)
            DispatchQueue.main.async(execute: {
                self.requests.success()
            })
            return response
        } catch(let error) {
            DispatchQueue.main.async(execute: {
                self.requests.failure()
            })
            throw error
        }
    }

    /// RequestInterceptorでリクエストを送る
    override func request<T: RequestType>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> T.ResponseType {
        DispatchQueue.main.async(execute: {
            self.requests.append(SPProgress(request))
        })
        do {
            let response: T.ResponseType = try await super.request(request, interceptor: interceptor)
            DispatchQueue.main.async(execute: {
                self.requests.success()
            })
            return response
        } catch(let error) {
            DispatchQueue.main.async(execute: {
                self.requests.failure()
            })
            throw error
        }
    }
}
