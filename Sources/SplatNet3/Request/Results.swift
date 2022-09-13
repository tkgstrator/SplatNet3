//
//  CoopResult.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

extension CoopResult {
    public struct Result: Codable {
        public let id: String
        public let jobScore: Int?
//        public let grade: GradeType?
//        public let otherResults: [PlayerResult]
        public let kumaPoint: Int?
//        public let waveDetails: [WaveResult]
//        public let jobResult: JobResult
//        public let myResult: PlayerResult
        public let gradePoint: Int?
        public let jobRate: Double?
//        public let startTime: Int
//        public let endTime: Int
        public let playTime: Int
//        public let BossCounts: [Int]
//        public let bossKillCounts: [Int]
        public let dangerRate: Double
        public let jobBonus: Int?

        public init(from response: Response) {
            let formatter: ISO8601DateFormatter = ISO8601DateFormatter()
            let result: CoopHistoryDetail = response.data.coopHistoryDetail

            self.id = result.id
            self.jobScore = result.jobScore
            self.gradePoint = result.afterGradePoint
            self.kumaPoint = result.jobPoint
            self.jobRate = result.jobRate
            self.jobBonus = result.jobBonus
            self.dangerRate = result.dangerRate
            self.playTime = Int(formatter.date(from: result.playedTime)!.timeIntervalSince1970)
        }
    }

    public struct PlayerResult: Codable {
        public let pid: String
        public let goldenIkuraNum: Int
        public let ikuraNum: Int
        public let deadCount: Int
        public let helpCount: Int
        public let name: String
        public let weaponList: [Int]
        public let special: Int
        public let specialCounts: [Int]
        public let bossKillCounts: Int

//        public init(from result: MyResult) {
//            self.goldenIkuraNum = result.goldenDeliverCount
//            self.ikuraNum = result.deliverCount
//            self.deadCount = result.rescuedCount
//            self.helpCount = result.rescuedCount
//            self.special = result.specialWeapon.id
////            self.weaponList = result.weapons.map({ $0.})
//        }
    }
}

extension CoopResult.Response {

    public func asSplatNet2() -> CoopResult.Result {
        return CoopResult.Result(from: self)
    }
}
