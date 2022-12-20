//
//  DataRequest.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyBeaver

extension DataRequest {
    @discardableResult
    public func validationWithNXError() -> Self {
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return cURLDescription(calling: { requestURL in
            SwiftyLogger.debug(requestURL)
        })
        .validate({ request, response, data in
            DataRequest.ValidationResult(catching: {
                if let targetURL = request?.url,
                   targetURL.lastPathComponent != "graphql"
                {
                    /// アクセスしたURLをログに保存
                    SwiftyLogger.info("RequestURL: \(targetURL)")
                }
                if let data = data {
                    if let url: URL = request?.url,
                       url.lastPathComponent != "graphql",
                       let response = try? JSONSerialization.jsonObject(with: data)
                    {
                        #if DEBUG
                        /// 取得したデータをログに保存
                        SwiftyLogger.verbose(response)
                        #endif
                    }

                    if let failure = try? decoder.decode(Failure.NSO.self, from: data) {
                        throw failure
                    }
                    if let failure = try? decoder.decode(Failure.APP.self, from: data) {
                        throw failure
                    }
                }
                if (response.statusCode < 200) || (response.statusCode >= 400) {
                    SwiftyLogger.error("Unacceptable status code: \(response.statusCode)")
                    throw Failure.API(statusCode: response.statusCode)
                }
            })
        })
    }
}
