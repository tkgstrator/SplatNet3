//
//  SPSession.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import Alamofire

open class SPSession: Authorize, Authenticator, ObservableObject {
    @Published var requests: [Progress] = []

    public typealias Credential = UserInfo

    public func apply(_ credential: UserInfo, to urlRequest: inout URLRequest) {
        if let bulletToken: String = credential.bulletToken {
            urlRequest.headers.add(.authorization(bearerToken: bulletToken))
            urlRequest.headers.add(.init(name: "X-Web-View-Ver", value: "1.0.0-433ec0e8"))
        }
    }

    public func refresh(_ credential: UserInfo, for session: Alamofire.Session, completion: @escaping (Result<UserInfo, Error>) -> Void) {
        if credential.requiresGameWebTokenRefresh {
            Task {
                do {
                    let account: UserInfo = try await getBulletToken(sessionToken: credential.sessionToken)
                    completion(.success(account))
                    return
                } catch(let error) {
                    completion(.failure(error))
                    return
                }
            }
        }
        if credential.requiresRefresh {
            Task {
                do {
                    let account: UserInfo = try await refreshBulletToken(gameWebToken: credential.gameWebToken)
                    completion(.success(account))
                    return
                } catch(let error) {
                    completion(.failure(error))
                    return
                }
            }
        }
    }

    public func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: UserInfo) -> Bool {
        return false
    }

    public func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
        return response.statusCode == 401
    }

    override func request<T: RequestType>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> String {
        DispatchQueue.main.async(execute: {
            self.requests.append(Progress(request))
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
            self.requests.append(Progress(request))
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

    /// AuthenticationInterceptorでリクエストを送る
    public func request<T: RequestType>(_ request: T) async throws -> T.ResponseType {
        let interceptor: AuthenticationInterceptor<SPSession>? = {
            guard let account = self.account else {
                return nil
            }
            return AuthenticationInterceptor(authenticator: self, credential: account)
        }()
        do {
            let response = try await session.request(request, interceptor: interceptor)
                .validationWithNXError()
                .serializingDecodable(T.ResponseType.self, decoder: decoder)
                .value
            #if DEBUG
            dump(response)
            #endif
            return response
        } catch(let error) {
            logger.error(error.localizedDescription)
            throw error
        }
    }
}
