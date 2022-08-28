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

    /// ステータスコード
    var statusCode: Int { get }
}

/// エラーレスポンス
public enum Failure {
    /// NSO用のエラーレスポンス
    public struct NSO: FailureResponse {
        public let errorDescription: NXError.NSO
        public let error: String
        public var failureReason: String? {
            NSLocalizedString(errorDescription.rawValue, bundle: .module, comment: "")
        }
        /// ステータスコード
        /// NSOのエラーは全て400っぽい
        public var statusCode: Int {
            return 400        }
    }

    /// APP用のエラーレスポンス
    public struct APP: FailureResponse {
        public let errorMessage: NXError.APP
        public let status: Int
        public let correlationId: String
        public var failureReason: String? {
            NSLocalizedString(errorMessage.rawValue, bundle: .module, comment: "")
        }
        /// ステータスコード
        /// 何故か9000のオフセットがついているのでそれを考慮する
        public var statusCode: Int {
            status - 9000
        }
    }
}
