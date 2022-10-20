//
//  CoopResult.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire
import SwiftUI

public class SplatNet2 {
    public struct Result: Codable {
        /// ID
        public let id: String
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
        /// スケジュール
        public let schedule: Schedule
        /// 金イクラ納品数
        public let goldenIkuraNum: Int
        /// 金イクラアシスト納品数
        public let goldenIkuraAssistNum: Int
        /// イクラ納品数
        public let ikuraNum: Int
        /// オカシラメーター
        public let smellMeter: Int?
        /// シナリオコード
        public let scenarioCode: String?

        public init(from response: CoopHistoryDetail.Response, schedule: CoopHistoryElement) {
            let formatter: ISO8601DateFormatter = ISO8601DateFormatter()
            let result: CoopHistoryDetail.Detail = response.data.coopHistoryDetail

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
            self.scale = [result.scale?.bronze, result.scale?.silver, result.scale?.gold]
            self.jobResult = JobResult(from: result)
            self.schedule = Schedule(schedule: schedule)
            self.smellMeter = result.smellMeter
            self.scenarioCode = result.scenarioCode

            let players: [CoopHistoryDetail.PlayerResult] = [result.myResult] + result.memberResults
            self.ikuraNum = players.map({ $0.deliverCount }).reduce(0, +)
            self.goldenIkuraNum = players.map({ $0.goldenDeliverCount }).reduce(0, +)
            self.goldenIkuraAssistNum = players.map({ $0.goldenAssistCount }).reduce(0, +)
        }
    }

    public struct Schedule: Codable {
        public let startTime: String?
        public let endTime: String?
        public let mode: Common.Mode
        public let rule: Common.Rule
        public let weaponLists: [WeaponType]
        public let stage: StageType

        public init(schedule: CoopHistoryElement) {
            self.startTime = schedule.startTime
            self.endTime = schedule.endTime
            self.mode = schedule.mode
            self.rule = schedule.rule
            self.weaponLists = schedule.weaponList
            self.stage = schedule.stage
        }
    }

    public struct JobResult: Codable {
        /// クリアしたかどうか
        public let isClear: Bool
        /// 失敗したWAVE
        public let failureWave: Int?
        /// オカシラシャケ討伐したか
        public let isBossDefeated: Bool?

        public init(from result: CoopHistoryDetail.Detail) {
            self.isClear = result.resultWave == 0
            self.failureWave = result.resultWave == 0 ? nil : result.resultWave
            self.isBossDefeated = result.bossResult?.hasDefeatBoss
        }
    }

    public struct Nameplate: Codable {
        public let badges: [BadgeType?]
        public let background: Background

        public init(from nameplate: Common.Nameplate) {
            self.badges = nameplate.badges.map({ badge in
                if let id = badge?.id {
                    return BadgeType(rawValue: id)
                }
                return nil
            })
            self.background = Background(from: nameplate.background)
        }
    }

    public struct Background: Codable {
        public let textColor: Common.TextColor
        public let id: NamePlateType

        public init(from background: Common.Background) {
            self.textColor = background.textColor
            self.id = NamePlateType(rawValue: background.id) ?? NamePlateType.Npl_Tutorial00
        }
    }
    
    public struct PlayerResult: Codable {
        public let id: String
        public let isMyself: Bool
        public let byname: String
        public let name: String
        public let nameId: String
        public let nameplate: Nameplate
        public let goldenIkuraNum: Int
        public let goldenIkuraAssistNum: Int
        public let ikuraNum: Int
        public let deadCount: Int
        public let helpCount: Int
        public let weaponList: [WeaponType]
        public let special: SpecialType?
        public let specialCounts: [Int]
        public let bossKillCounts: [Int]
        public let bossKillCountsTotal: Int
        public let species: SpeciesType

        public init(from player: CoopHistoryDetail.PlayerResult, enemies: [CoopHistoryDetail.EnemyResult], counts: [[Int]]) {
            let specialId: Int? = player.specialWeapon?.id

            self.id = player.player.id
            self.isMyself = player.player.isMyself
            self.nameId = player.player.nameId
            self.name = player.player.name
            self.byname = player.player.byname
            self.ikuraNum = player.deliverCount
            self.goldenIkuraAssistNum = player.goldenAssistCount
            self.goldenIkuraNum = player.goldenDeliverCount
            self.deadCount = player.rescuedCount
            self.helpCount = player.rescueCount
            self.nameplate = Nameplate(from: player.player.nameplate)
            self.special = {
                if let specialId = specialId {
                    return SpecialType(id: specialId)
                }
                return nil
            }()
            self.weaponList = player.weapons.compactMap({ WeaponType(id: $0.id) })
            self.bossKillCountsTotal = player.defeatEnemyCount
            self.bossKillCounts = player.player.isMyself ? enemies.defeatedCounts() : Array(repeating: 0, count: 15)
            self.species = player.player.species
            self.specialCounts = counts.map({ ids in ids.filter({ $0 == specialId }).count })
        }
    }

    public struct WaveResult: Codable {
        public let id: Int
        public let waterLevel: WaterType
        public let eventType: EventType
        public let goldenIkuraNum: Int?
        public let quotaNum: Int?
        public let goldenIkuraPopNum: Int

        public init(from result: CoopHistoryDetail.WaveResult) {
            self.id = result.waveNumber
            self.waterLevel = WaterType(id: result.waterLevel) ?? WaterType.Middle_Tide
            self.eventType = EventType(id: result.eventWave?.id) ?? EventType.Water_Levels
            self.goldenIkuraNum = result.teamDeliverCount
            self.quotaNum = result.deliverNorm
            self.goldenIkuraPopNum = result.goldenPopCount
        }
    }

}

extension CoopHistoryDetail.Response {
    public func asSplatNet2(schedule: CoopHistoryElement) -> SplatNet2.Result {
        return SplatNet2.Result(from: self, schedule: schedule)
    }
}

extension Collection where Element == CoopHistoryDetail.EnemyResult {
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
