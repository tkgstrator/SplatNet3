//
//  CoopResult.swift
//  
//
//  Created by devonly on 2022/11/26.
//

import Foundation

public struct CoopResult: Codable {
    public let id: String
    public let uuid: String
    public let scale: [Int?]
    @NullCodable public var jobScore: Int?
    @NullCodable public var gradeId: GradeId?
    @NullCodable public var kumaPoint: Int?
    public let waveDetails: [WaveResult]
    public let jobResult: JobResult
    public let myResult: PlayerResult
    public let otherResults: [PlayerResult]
    @NullCodable public var gradePoint: Int?
    @NullCodable public var jobRate: Decimal?
    public let playTime: Date
    public let bossCounts: [Int]
    public let bossKillCounts: [Int]
    public let dangerRate: Decimal
    @NullCodable public var jobBonus: Int?
    public let schedule: Schedule
    public let goldenIkuraNum: Int
    public let goldenIkuraAssistNum: Int
    public let ikuraNum: Int
    @NullCodable public var smellMeter: Int?
    @NullCodable public var scenarioCode: String?

    public struct Schedule: Codable, Hashable {
        public let startTime: Date?
        public let endTime: Date?
        public let mode: ModeType
        public let rule: RuleType
        public let weaponList: [WeaponId]
        public let stageId: CoopStageId

        init(schedule: CoopHistoryQuery.CoopSchedule, content: CoopHistoryDetailQuery.CoopHistoryDetail) {
            self.startTime = schedule.startTime
            self.endTime = schedule.endTime
            self.mode = schedule.mode
            self.rule = schedule.rule
            self.weaponList = content.weapons.map({ $0.image.url.asWeaponId() })
            self.stageId = content.coopStage.id
        }
    }

    public struct PlayerResult: Codable {
        public let id: String
        public let isMyself: Bool
        public let byname: String
        public let name: String
        public let nameId: String
        public let nameplate: Nameplate
        public let goldenIkuraAssistNum: Int
        public let goldenIkuraNum: Int
        public let ikuraNum: Int
        public let deadCount: Int
        public let helpCount: Int
        public let weaponList: [WeaponId]
        @NullCodable public var specialId: SpecialId?
        public let specialCounts: [Int]
        public let bossKillCounts: [Int]
        public let bossKillCountsTotal: Int
        public let uniform: SkinInfoId
        public let species: SpeciesType

        init(
            content: CoopHistoryDetailQuery.MemberResult,
            results: [CoopHistoryDetailQuery.EnemyResult],
            specialCounts: [[SpecialId]],
            isMyself: Bool
        ) {
            self.id = content.player.id.uid
            self.isMyself = isMyself
            self.byname = content.player.byname
            self.name = content.player.name
            self.nameId = content.player.nameId
            self.nameplate = Nameplate(
                badges: content.player.nameplate.badges.map({ $0?.id }),
                background: Background(
                    textColor: content.player.nameplate.background.textColor,
                    id: content.player.nameplate.background.id
                )
            )
            self.goldenIkuraNum = content.goldenDeliverCount
            self.goldenIkuraAssistNum = content.goldenAssistCount
            self.ikuraNum = content.deliverCount
            self.deadCount = content.rescuedCount
            self.helpCount = content.rescueCount
            self.weaponList = content.weapons.map({ $0.image.url.asWeaponId() })
            self.specialId = content.specialWeapon?.weaponId
            self.specialCounts = specialCounts.map({ $0.filter({ $0 == content.specialWeapon?.weaponId }).count })
            self.bossKillCounts = isMyself ? results.bossKillCounts() : Array(repeating: 0, count: 15)
            self.uniform = content.player.uniform.id
            self.bossKillCountsTotal = content.defeatEnemyCount
            self.species = content.player.species
        }
    }

    public struct WaveResult: Codable, Identifiable {
        public let id: Int
        public let isClear: Bool
        public let waterLevel: WaterLevelId
        public let eventType: EventId
        @NullCodable public var goldenIkuraNum: Int?
        @NullCodable public var quotaNum: Int?
        public let goldenIkuraPopNum: Int

        init(content: CoopHistoryDetailQuery.WaveResult, resultWave: Int, bossDefeated: Bool?) {
            self.id = content.waveNumber
            self.isClear = {
                // EX-WAVEがあれば
                if let bossDefeated = bossDefeated {
                    // EX-WAVEの結果はbossDefeated、それ以外はクリア
                    return content.waveNumber == 4 ? bossDefeated : true
                }
                // それ以外は失敗したWAVEかどうか
                return !(content.waveNumber == resultWave)
            }()
            self.waterLevel = content.waterLevel
            self.eventType = content.eventWave?.id ?? .Water_Levels
            self.goldenIkuraNum = content.teamDeliverCount
            self.quotaNum = content.deliverNorm
            self.goldenIkuraPopNum = content.goldenPopCount
        }
    }

    public struct JobResult: Codable {
        public let isClear: Bool
        @NullCodable public var failureWave: Int?
        @NullCodable public var isBossDefeated: Bool?
        @NullCodable public var bossId: EnemyId?

        init(content: CoopHistoryDetailQuery.CoopHistoryDetail) {
            self.isClear = content.resultWave == 0
            self.failureWave = content.resultWave == 0 ? nil : content.resultWave
            self.isBossDefeated = content.bossResult?.hasDefeatBoss
            self.bossId = content.bossResult?.boss.id
        }
    }

    public struct Nameplate: Codable {
        public let badges: [BadgeId?]
        public let background: Background
    }

    public struct Background: Codable {
        public let textColor: Common.TextColor
        public let id: NameplateId
    }

    public init(history: CoopHistoryQuery.CoopSchedule, content: CoopHistoryDetailQuery.CoopHistoryDetail) {
        self.id = content.id.description.base64DecodedString!
        self.uuid = content.id.uuid
        self.scale = [content.scale?.bronze, content.scale?.silver, content.scale?.gold]
        self.jobScore = content.jobScore
        self.kumaPoint = content.jobPoint
        self.waveDetails = content.waveResults.map({ WaveResult(content: $0, resultWave: content.resultWave, bossDefeated: content.bossResult?.hasDefeatBoss) })
        self.jobResult = JobResult(content: content)
        let specialCounts: [[SpecialId]] = content.waveResults.map({ $0.specialWeapons.map({ $0.id }) })
        self.myResult = PlayerResult(content: content.myResult, results: content.enemyResults, specialCounts: specialCounts, isMyself: true)
        self.otherResults = content.memberResults.map({ PlayerResult(content: $0, results: [], specialCounts: specialCounts, isMyself: false) })
        self.gradeId = content.afterGrade?.id
        self.gradePoint = content.afterGradePoint
        self.jobRate = content.jobRate
        self.playTime = content.playedTime
        self.bossCounts = content.enemyResults.bossCounts()
        self.bossKillCounts = content.enemyResults.teamBossKillCounts()
        self.dangerRate = content.dangerRate
        self.jobBonus = content.jobBonus
        self.schedule = Schedule(schedule: history, content: content)
        self.ikuraNum = ([content.myResult] + content.memberResults).map({ $0.deliverCount }).reduce(0, +)
        self.goldenIkuraNum = ([content.myResult] + content.memberResults).map({ $0.goldenDeliverCount }).reduce(0, +)
        self.goldenIkuraAssistNum = ([content.myResult] + content.memberResults).map({ $0.goldenAssistCount }).reduce(0, +)
        self.smellMeter = content.smellMeter
        self.scenarioCode = content.scenarioCode
    }
}

extension Collection where Element == CoopHistoryDetailQuery.EnemyResult {
    func bossKillCounts() -> [Int] {
        EnemyId.allCases.compactMap({ element in
            self.first(where: { $0.enemy.id == element })?.defeatCount ?? .zero
        })
    }

    func teamBossKillCounts() -> [Int] {
        EnemyId.allCases.compactMap({ element in
            self.first(where: { $0.enemy.id == element })?.teamDefeatCount ?? .zero
        })
    }

    func bossCounts() -> [Int] {
        EnemyId.allCases.compactMap({ element in
            self.first(where: { $0.enemy.id == element })?.popCount ?? .zero
        })
    }
}
