//
//  CoopResult.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

public class SplatNet2 {
    public struct Result: Codable {
        public let id: String
        public let jobScore: Int?
        public let grade: GradeType?
        public let kumaPoint: Int?
        public let waveDetails: [WaveResult]
        //        public let jobResult: JobResult
        public let myResult: PlayerResult
        public let otherResults: [PlayerResult]
        public let gradePoint: Int?
        public let jobRate: Double?
        //        public let startTime: Int
        //        public let endTime: Int
        public let playTime: Int
        public let bossCounts: [Int]
        public let bossKillCounts: [Int]
        public let dangerRate: Double
        public let jobBonus: Int?
        public let isBossDefeated: Bool?

        public init(from response: CoopResult.Response) {
            let formatter: ISO8601DateFormatter = ISO8601DateFormatter()
            let result: CoopResult.CoopHistoryDetail = response.data.coopHistoryDetail

            let specialCounts: [[Int]] = result.waveResults.map({ $0.specialWeapons.map({ $0.id })})

            self.id = result.id
            self.jobScore = result.jobScore
            self.gradePoint = result.afterGradePoint
            self.kumaPoint = result.jobPoint
            self.jobRate = result.jobRate
            self.jobBonus = result.jobBonus
            self.dangerRate = result.dangerRate
            self.playTime = Int(formatter.date(from: result.playedTime)!.timeIntervalSince1970)
            self.myResult = PlayerResult(from: result.myResult, counts: specialCounts)
            self.otherResults = result.memberResults.map({ PlayerResult(from: $0, counts: specialCounts) })
            self.waveDetails = result.waveResults.map({ WaveResult(from: $0) })
            self.bossCounts = result.enemyResults.popCounts()
            self.bossKillCounts = result.enemyResults.teamDefeatedCounts()
            self.grade = GradeType(id: result.afterGrade?.id)
            self.isBossDefeated = result.bossResult?.hasDefeatBoss
        }
     }

    public struct Nameplate: Codable {
        public let badges: [Int?]
        public let background: Background
    }

    public struct Background: Codable {
        public let textColor: CoopResult.TextColor
        public let id: Int
    }
    
    public struct PlayerResult: Codable {
        public let id: String
        public let byname: String
        public let name: String
        public let nameId: Int
//        public let nameplate: Nameplate
        public let goldenIkuraNum: Int
        public let goldenIkuraAssistNum: Int
        public let ikuraNum: Int
        public let deadCount: Int
        public let helpCount: Int
        public let weaponList: [WeaponType]
        public let special: Int
        public let specialCounts: [Int]
        public let bossKillCounts: Int
        public let species: CoopResult.Species

        public init(from result: CoopResult.PlayerResult, counts: [[Int]]) {
            let specialId: Int = result.specialWeapon.id
            self.id = result.player.id
            self.nameId = result.player.nameID
            self.name = result.player.name
            self.byname = result.player.byname
            self.ikuraNum = result.deliverCount
            self.goldenIkuraAssistNum = result.goldenAssistCount
            self.goldenIkuraNum = result.goldenDeliverCount
            self.deadCount = result.rescuedCount
            self.helpCount = result.rescueCount
            self.special = specialId
            self.weaponList = result.weapons.compactMap({ WeaponType(id: $0.id) })
            self.bossKillCounts = result.defeatEnemyCount
            self.species = result.player.species
            self.specialCounts = counts.map({ ids in ids.filter({ $0 == specialId }).count })
//            self.nameplate = result.player.nameplate
        }
    }

    public struct WaveResult: Codable {
        public let id: Int
        public let waterLevel: Int
        public let eventType: Int
        public let goldenIkuraNum: Int?
        public let quotaNum: Int?
        public let goldenIkuraPopNum: Int

        public init(from result: CoopResult.WaveResult) {
            self.id = result.waveNumber
            self.waterLevel = result.waterLevel
            self.eventType = result.eventWave?.id ?? 0
            self.goldenIkuraNum = result.teamDeliverCount
            self.quotaNum = result.deliverNorm
            self.goldenIkuraPopNum = result.goldenPopCount
        }
    }

}

extension CoopResult.Response {
    public func asSplatNet2() -> SplatNet2.Result {
        return SplatNet2.Result(from: self)
    }
}

extension Collection where Element == CoopResult.EnemyResult {
    public func teamDefeatedCounts() -> [Int] {
        SakelienType.allCases.compactMap({ sakelien in self.first(where: { $0.enemy.id == sakelien.id })?.teamDefeatCount ?? 0 })
    }

    public func popCounts() -> [Int] {
        SakelienType.allCases.compactMap({ sakelien in self.first(where: { $0.enemy.id == sakelien.id })?.popCount ?? 0 })
    }
}
