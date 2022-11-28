//
//  Failure.swift
//  
//
//  Created by tkgstrator on 2022/11/28.
//  
//

import Foundation

enum Failure {
    struct NSO: Codable, Error {
        let errorDescription: NXErrorDescription
        let error: NXError
        let correlationId: String
    }

    struct APP: Codable, Error {
        let errorMessage: NXErrorMessage
        let statusCode: Int
        let correlationId: String
    }

    struct API: Codable, Error {
        let statusCode: Int
    }
}
