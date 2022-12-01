//
//  Failure.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

enum Failure {
    struct NSO: Codable, Error {
        let errorDescription: NXErrorDescription
        let error: NXError
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
