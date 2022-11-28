//
//  Authorize+RequestInterceptor.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

extension Session: RequestInterceptor {
    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(request.retryCount == 0 ? .retryWithDelay(0.5) : .doNotRetry)
    }
}
