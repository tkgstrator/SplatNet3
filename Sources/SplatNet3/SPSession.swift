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
    @Published public var requests: [SPProgress] = []

    public override init() {}

    override func request(_ request: IksmSession) async -> [String : String]? {
        DispatchQueue.main.async(execute: {
            self.requests.append(SPProgress(request))
        })
        let response: [String: String]? = await super.request(request)
        DispatchQueue.main.async(execute: {
            self.requests.success()
        })
        return response
    }

    override open func request<T>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> T.ResponseType where T : RequestType {
        do {
            DispatchQueue.main.async(execute: {
                self.requests.append(SPProgress(request))
            })
            let response: T.ResponseType = try await super.request(request)
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

    override open func request<T>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> String where T : RequestType {
        do {
            DispatchQueue.main.async(execute: {
                self.requests.append(SPProgress(request))
            })
            let response: String = try await super.request(request)
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
