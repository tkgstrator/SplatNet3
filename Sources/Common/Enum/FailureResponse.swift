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
public protocol FailureResponse: LocalizedError, Codable {
    /// エラー内容
    var errorDescription : String? { get }

    /// エラー理由
    var failureReason: String? { get }

    /// ステータスコード
    var statusCode: Int { get }
}

/// エラーレスポンス
public enum Failure {
    /// NSO用のエラーレスポンス
    public struct NSO: FailureResponse {
        public var errorDescription: String?
        public var failureReason: String? = nil
        public var statusCode: Int = 400
        // 独自プロパティ
        public let error: NXError.NSO

        public init(error: NXError.NSO) {
            self.error = error
            self.errorDescription = NSLocalizedString(error.rawValue, bundle: .module, comment: "")
        }
    }

    /// APP用のエラーレスポンス
    public struct APP: FailureResponse {
        public var errorDescription: String? {
            return NSLocalizedString(errorMessage.rawValue, bundle: .module, comment: "")
        }
        public var failureReason: String? = nil
        public var statusCode: Int {
            status - 9000
        }
        // 独自プロパティ
        public let errorMessage: NXError.APP
        public let status: Int
        public let correlationId: String

        public init(error: NXError.APP) {
            self.errorMessage = error
            self.status = 9999
            self.correlationId = "Dummy data."
        }
    }

    /// API用のエラーレスポンス
    public struct API: FailureResponse {
        public let errorDescription: String?
        public var failureReason: String?
        public var statusCode: Int

        public init(statusCode: Int) {
            self.errorDescription = "Unacceptable status code."
            self.failureReason = "Unacceptable status code."
            self.statusCode = statusCode
        }

        public init(error: NXError.API) {
            self.errorDescription = error.rawValue
            self.failureReason = "Unacceptable status code."
            self.statusCode = 400
        }
    }
}
