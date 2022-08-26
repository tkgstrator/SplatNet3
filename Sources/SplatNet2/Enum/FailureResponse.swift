//
//  FailureResponse.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/05/06.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

/// エラーを受け取るプロトコル
public protocol FailureResponse: Codable {
    /// エラー理由
    var failureReason: String? { get }
}

/// エラーレスポンス
public enum Failure {
    /// NSO用のエラーレスポンス
    public struct NSO: FailureResponse {
        public let errorDescription: String
        public let error: String
        public var failureReason: String? {
            errorDescription
        }
    }

    /// APP用のエラーレスポンス
    public struct APP: FailureResponse {
        public let errorMessage: String
        public let status: Int
        public let correlationId: String
        public var failureReason: String? {
            errorMessage
        }
    }

    /// S2S用のエラーレスポンス
    public struct S2S: FailureResponse {
        public let error: String
        public var failureReason: String? {
            error
        }
    }
}
