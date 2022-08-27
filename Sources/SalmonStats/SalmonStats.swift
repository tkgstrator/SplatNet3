//
//  SalmonStats.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Common
import Combine
import SplatNet2
import Foundation

public class SalmonStats: SplatNet2 {

    public override init(account: UserInfo?) {
        super.init(account: account)
    }

    public override init() {
        super.init()
    }

    internal func uploadResult(resultId: Int) async throws -> UploadResult.Response {
        let result: CoopResult.Response = try await publish(CoopResult(resultId: resultId))
        let request: UploadResult = UploadResult(result: result)
        return try await publish(request)
    }
}
