//
//  SplatNet3+Cookie.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

extension SplatNet3 {
    /// 概要取得
    public func getCoopSummary() async throws -> CoopSummary.Response {
        let request: CoopSummary = CoopSummary()
        return try await publish(request)
    }
}

public extension Sequence {
    func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(transform(element))
        }

        return values
    }
}
