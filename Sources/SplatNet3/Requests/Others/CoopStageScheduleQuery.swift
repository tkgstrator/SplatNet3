//
//  CoopStageScheduleQuery.swift
//  
//
//  Created by devonly on 2022/12/04.
//

import Foundation
import Alamofire

public class CoopStageScheduleQuery: RequestType {
    public typealias ResponseType = [CoopSchedule]
    public var baseURL: URL = URL(unsafeString: "https://asia-northeast1-tkgstratorwork.cloudfunctions.net/")
    public var path: String = "api/schedules/all"
    public var parameters: Parameters?
    public var headers: [String: String]?
    public var method: HTTPMethod = .get

    init() {}
}

