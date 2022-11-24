//
//  SPSession.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import Alamofire

open class SPSession: Authorize, ObservableObject {
    @Published var requests: [Progress] = []

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
}
