//
//  SplatNet3.swift
//
//
//  Created by devonly on 2022/11/22.
//

import Foundation
import Alamofire

public class Session: SPSession, Authenticator {
    public typealias Credential = UserInfo

    public func apply(_ credential: UserInfo, to urlRequest: inout URLRequest) {
        if let bulletToken: String = credential.bulletToken {
            urlRequest.headers.add(.authorization(bearerToken: bulletToken))
        }
    }

    public func refresh(_ credential: UserInfo, for session: Alamofire.Session, completion: @escaping (Result<UserInfo, Error>) -> Void) {
        let session: SPSession = SPSession()
        Task {
            do {
                let account: UserInfo = try await session.refresh(contentId: .SP3)
                completion(.success(account))
            } catch(let error) {
                completion(.failure(error))
            }
        }
    }

    public func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: UserInfo) -> Bool {
        return false
    }

    public func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
        return response.statusCode == 401
    }

    func request<T: RequestType>(_ request: T) async throws -> T.ResponseType {
        let interceptor: AuthenticationInterceptor<Session>? = {
            guard let account = account else {
                return nil
            }
            return AuthenticationInterceptor(authenticator: self, credential: account)
        }()
        return try await session.request(request, interceptor: interceptor)
            .serializingDecodable(T.ResponseType.self, decoder: decoder)
            .value
    }

    public func getCoopHistoryQuery() async throws -> CoopHistoryQuery.CoopResult {
        return try await request(CoopHistoryQuery()).data.coopResult
    }
}
