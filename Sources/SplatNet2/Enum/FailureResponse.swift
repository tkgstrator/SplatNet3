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
        public let errorDescription: SP2Error.NSO
        public let error: String
        public var failureReason: String? {
            errorDescription.rawValue
        }
    }

    /// APP用のエラーレスポンス
    public struct APP: FailureResponse {
        public let errorMessage: SP2Error.APP
        public let status: Int
        public let correlationId: String
        public var failureReason: String? {
            errorMessage.rawValue
        }
    }
}
