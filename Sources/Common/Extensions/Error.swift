//
//  Error.swift
//  Common
//
//  Created by tkgstrator on 2022/09/17.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

extension Error {
    public var asNXError: FailureResponse? {
        if let error: Failure.NSO = self as? Failure.NSO {
            return error
        }

        if let error: Failure.APP = self as? Failure.APP {
            return error
        }

        if let error: Failure.API = self as? Failure.API {
            return error
        }

        if let error: NXError.NSO = self as? NXError.NSO {
            return Failure.NSO(error: error)
        }

        if let error: NXError.APP = self as? NXError.APP {
            return Failure.APP(error: error)
        }

        if let error: NXError.API = self as? NXError.API {
            let statusCode: Int = self.asAFError?.responseCode ?? 400
            return Failure.API(statusCode: statusCode)
        }

        if let error: AFError = self.asAFError {
            switch error {
            case .createUploadableFailed(let error):
                return nil
            case .createURLRequestFailed(let error):
                return nil
            case .downloadedFileMoveFailed(let error, let source, let destination):
                return nil
            case .explicitlyCancelled:
                return nil
            case .invalidURL(let url):
                return nil
            case .multipartEncodingFailed(let reason):
                print(reason)
                return nil
            case .parameterEncodingFailed(let reason):
                print(reason)
                return nil
            case .parameterEncoderFailed(let reason):
                print(reason)
                return nil
            case .requestAdaptationFailed(let error):
                print(error)
                return nil
            case .requestRetryFailed(let retryError, let originalError):
                print(retryError, originalError)
                return nil
            case .responseValidationFailed(let reason):
                switch reason {
                case .dataFileNil:
                    return nil
                case .dataFileReadFailed(let at):
                    return nil
                case .missingContentType(let acceptableContentTypes):
                    return nil
                case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                    return nil
                case .unacceptableStatusCode(let code):
                    return Failure.API(statusCode: code)
                case .customValidationFailed(let error):
                    if let failure = error as? Failure.NSO {
                        return failure
                    }
                    if let failure = error as? Failure.APP {
                        return failure
                    }
                    if let failure = error as? Failure.API {
                        return failure
                    }
                }
                print(reason)
                return nil
            case .responseSerializationFailed(let reason):
                print(reason)
                switch reason {
                case .inputDataNilOrZeroLength:
                    return nil
                case .inputFileNil:
                    return nil
                case .inputFileReadFailed(let at):
                    return nil
                case .stringSerializationFailed(let encoding):
                    return nil
                case .jsonSerializationFailed(let error):
                    return nil
                case .decodingFailed(let error):
                    return nil
                case .customSerializationFailed(let error):
                    return nil
                case .invalidEmptyResponse(let type):
                    return nil
                }
                return nil
            case .serverTrustEvaluationFailed(let reason):
                print(reason)
                return nil
            case .sessionDeinitialized:
                return nil
            case .sessionInvalidated(let error):
                print(error)
                return nil
            case .sessionTaskFailed(let error):
                print(error)
                return nil
            case .urlRequestValidationFailed(let reason):
                print(reason)
                return nil
            }
        }

        return nil
    }
}
