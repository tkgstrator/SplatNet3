//
//  DataRequest.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

public extension DataRequest {
    @discardableResult
    func validationWithNXError() -> Self {
        let decoder: JSONDecoder = {
            let decoder: JSONDecoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()
        
        return validate({ request, response, data in
            DataRequest.ValidationResult(catching: {
                if let data = data {
                    if let failure = try? decoder.decode(Failure.NSO.self, from: data) {
                        throw AFError.responseValidationFailed(reason: .customValidationFailed(error: failure.errorDescription))
                    }
                    if let failure = try? decoder.decode(Failure.APP.self, from: data) {
                        throw AFError.responseValidationFailed(reason: .customValidationFailed(error: failure.errorMessage))
                    }
                }
                if (response.statusCode < 200) || (response.statusCode >= 400) {
                    throw AFError.responseValidationFailed(reason: .unacceptableStatusCode(code: response.statusCode))
                }
            })
        })
    }
}
