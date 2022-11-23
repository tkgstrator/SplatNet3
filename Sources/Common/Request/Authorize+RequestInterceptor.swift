//
//  Authorize+RequestInterceptor.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import Alamofire

extension Authorize: RequestInterceptor {
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(request.retryCount == 0 ? .retryWithDelay(0.5) : .doNotRetry)
    }
}
