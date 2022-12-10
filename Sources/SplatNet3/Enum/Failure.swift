//
//  Failure.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

enum Failure {
    struct NSO: Codable, Error, LocalizedError {
        let errorMessage: NXErrorDescription
        let error: NXError

        var errorDescription: String? {
            errorMessage.rawValue
        }

        var failureReason: String? {
            error.rawValue
        }

        enum CodingKeys: String, CodingKey {
            case errorMessage   = "errorDescription"
            case error          = "error"
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.errorMessage = try container.decode(NXErrorDescription.self, forKey: .errorMessage)
            self.error = try container.decode(NXError.self, forKey: .error)
        }
    }

    struct APP: Codable, Error, LocalizedError {
        let errorMessage: NXErrorMessage
        let status: Int
        let correlationId: String

        var errorDescription: String? {
            errorMessage.rawValue
        }
    }

    struct API: Codable, Error {
        let statusCode: Int
    }
}
