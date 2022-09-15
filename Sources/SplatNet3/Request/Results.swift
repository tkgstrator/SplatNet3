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
        /// ID
        public let id: String
        /// ルール
        public let rule: Rule
        /// ウロコ
        public let scale: [Int?]
        /// バイトスコア
        public let jobScore: Int?
        /// バイト評価
        public let grade: GradeType?
        /// クマサンポイント
        public let kumaPoint: Int?
        /// WAVE詳細
        public let waveDetails: [WaveResult]
        /// バイトリザルト
        public let jobResult: JobResult
        /// 自分のリザルト
        public let myResult: PlayerResult
        /// 仲間のリザルト
        public let otherResults: [PlayerResult]
        /// 評価ポイント
        public let gradePoint: Int?
        /// バイトレート
        public let jobRate: Double?
        /// 遊んだ時間
        public let playTime: Int
        /// オオモノ出現数
        public let bossCounts: [Int]
        /// オオモノ討伐数
        public let bossKillCounts: [Int]
        /// キケン度
        public let dangerRate: Double
        /// バイトボーナス
        public let jobBonus: Int?
        /// 支給ブキ一覧
        public let weaponLists: [WeaponType]

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
            self.myResult = PlayerResult(from: result.myResult, enemies: result.enemyResults, counts: specialCounts)
            self.otherResults = result.memberResults.map({ PlayerResult(from: $0, enemies: result.enemyResults, counts: specialCounts) })
            self.waveDetails = result.waveResults.map({ WaveResult(from: $0) })
            self.bossCounts = result.enemyResults.popCounts()
            self.bossKillCounts = result.enemyResults.teamDefeatedCounts()
            self.grade = GradeType(id: result.afterGrade?.id)
            self.rule = result.afterGrade?.id == nil ? Rule.PRIVATE : Rule.REGULAR
            self.scale = [result.scale?.bronze, result.scale?.silver, result.scale?.gold]
            self.jobResult = JobResult(from: result)
            self.weaponLists = result.weapons.compactMap({ WeaponType(id: $0.id)})
        }
    }

    public enum Rule: String, Codable, CaseIterable {
        case REGULAR    = "REGULAR"
        case PRIVATE    = "PRIVATE"
    }

    public struct JobResult: Codable {
        /// クリアしたかどうか
        public let isClear: Bool
        /// 失敗したWAVE
        public let failureWave: Int?
        /// オカシラシャケ討伐したか
        public let isBossDefeated: Bool?

        public init(from result: CoopResult.CoopHistoryDetail) {
            self.isClear = result.resultWave == 0
            self.failureWave = result.resultWave == 0 ? nil : result.resultWave
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
        public let bossKillCounts: [Int]
        public let bossKillCountsTotal: Int
        public let species: CoopResult.Species

        public init(from player: CoopResult.PlayerResult, enemies: [CoopResult.EnemyResult], counts: [[Int]]) {
            let specialId: Int = player.specialWeapon.id

            self.id = player.player.id
            self.nameId = player.player.nameID
            self.name = player.player.name
            self.byname = player.player.byname
            self.ikuraNum = player.deliverCount
            self.goldenIkuraAssistNum = player.goldenAssistCount
            self.goldenIkuraNum = player.goldenDeliverCount
            self.deadCount = player.rescuedCount
            self.helpCount = player.rescueCount
            self.special = specialId
            self.weaponList = player.weapons.compactMap({ WeaponType(id: $0.id) })
            self.bossKillCountsTotal = player.defeatEnemyCount
            self.bossKillCounts = player.player.isMyself ? enemies.defeatedCounts() : Array(repeating: 0, count: 15)
            self.species = player.player.species
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

    public func defeatedCounts() -> [Int] {
        SakelienType.allCases.compactMap({ sakelien in self.first(where: { $0.enemy.id == sakelien.id })?.defeatCount ?? 0 })
    }

    public func popCounts() -> [Int] {
        SakelienType.allCases.compactMap({ sakelien in self.first(where: { $0.enemy.id == sakelien.id })?.popCount ?? 0 })
    }
}
