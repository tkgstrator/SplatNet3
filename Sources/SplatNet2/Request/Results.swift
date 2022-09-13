//
//  CoopSummary.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Common
import Foundation

public class CoopSummary: RequestType {
    public typealias ResponseType = CoopSummary.Response

    public var method: HTTPMethod = .get
    public var path: String = "coop_results"
    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var headers: [String: String]?

    init() {}

    // MARK: - CoopSummary
    public struct Response: Codable {
        let summary: Summary
//        let CoopSummary: [CoopResult.Response]
//        let rewardGear: RewardGear

        // MARK: - RewardGear
        struct RewardGear: Codable {
            let kind, thumbnail, image, id: String
            let name: String
            let brand: Brand
            let rarity: Int
        }

        // MARK: - Brand
        public struct Brand: Codable {
            public let id: String
            public let image: String
            public let name: String
        }

        // MARK: - Summary
        struct Summary: Codable {
//            let stats: [Stat]
            let card: Card
        }

        // MARK: - Card
        struct Card: Codable {
            let ikuraTotal: Int
            let kumaPointTotal: Int
            let kumaPoint: Int
            let goldenIkuraTotal: Int
            let jobNum: Int
            let helpTotal: Int
        }

        // MARK: - Stat
        struct Stat: Codable {
            let grade: CoopResult.GradeType
            let myGoldenIkuraTotal: Int
            let helpTotal: Int
            let deadTotal: Int
            let clearNum: Int
            let teamGoldenIkuraTotal: Int
            let failureCounts: [Int]
            let gradePoint: Int
            let schedule: Schedule
            let endTime: Int
            let startTime: Int
            let myIkuraTotal: Int
            let teamIkuraTotal: Int
            let kumaPointTotal: Int
            let jobNum: Int
        }
    }
}
