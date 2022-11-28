//
//  SPSessionr.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire

open class SPSession: Authorize, ObservableObject {
    @Published var requests: [SPProgress] = []

    override func request(_ request: IksmSession) async -> [String : String]? {
        requests.append(SPProgress(request))
        let response: [String: String]? = await super.request(request)
        requests.success()
        return response
    }

    override open func request<T>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> T.ResponseType where T : RequestType {
        do {
            requests.append(SPProgress(request))
            let response: T.ResponseType = try await super.request(request)
            requests.success()
            return response
        } catch(let error) {
            requests.failure()
            throw error
        }
    }

    override open func request<T>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> String where T : RequestType {
        do {
            requests.append(SPProgress(request))
            let response: String = try await super.request(request)
            requests.success()
            return response
        } catch(let error) {
            requests.failure()
            throw error
        }
    }
}
