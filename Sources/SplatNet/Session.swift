//
//  Session.swift
//  
//
//  Created by devonly on 2022/11/28.
//  
//

import Foundation
import Alamofire

open class SPSession {
    let session: Alamofire.Session = {
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.httpCookieAcceptPolicy = .never
        configuration.allowsCellularAccess = true
        return Alamofire.Session(configuration: configuration)
    }()
    let decoder: SPDecoder = SPDecoder()

    func request<T: RequestType>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> T.ResponseType {
        try await session.request(request, interceptor: interceptor)
            .serializingDecodable(T.ResponseType.self, decoder: decoder)
            .value
    }

    func request<T: RequestType>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> String {
        try await session.request(request, interceptor: interceptor)
            .serializingString(encoding: .utf8)
            .value
    }
}
