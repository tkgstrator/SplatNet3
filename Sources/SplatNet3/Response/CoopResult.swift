//
//  CoopResult.swift
//  
//
//  Created by devonly on 2022/11/26.
//

import Foundation

public struct CoopResult: Codable {
    public let id: String
    public let scale: CoopHistory.Scale
    public let jobScore: Int?
    public let grade: GradeId?
    public let kumaPoint: Int?
    public let waveDetails: [WaveResult]
    public let jobResult: JobResult
    public let myResult: PlayerResult
    public let otherResults: [PlayerResult]
    public let gradePoint: Int?
    public let jobRate: Double?
    public let playTime: Date
    public let bossCounts: [Int]
    public let bossKillCounts: [Int]
    public let dangerRate: Double
    public let jobBonus: Int?
    public let schedule: Schedule
    public let goldenIkuraNum: Int
    public let goldenIkuraAssistNum: Int
    public let ikuraNum: Int
    public let smellMeter: Int?
    public let scenarioCode: String?

    public struct Schedule: Codable {
        public let startTime: Date?
        public let endTime: Date?
        public let mode: ModeType
        public let rule: RuleType
        public let weaponList: [WeaponId]
        public let stage: CoopStageId

        init(content: CoopHistoryQuery.HistoryGroup, result: CoopHistoryDetailQuery.CoopHistoryDetail) {
            self.startTime = content.startTime
            self.endTime = content.endTime
            self.mode = content.mode
            self.rule = content.rule
            self.weaponList = result.weapons.map({ $0.image.url.asWeaponId() })
            self.stage = result.coopStage.id
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
        public let ikuraNum: Int
        public let deadCount: Int
        public let helpCount: Int
        public let weaponList: [WeaponId]
        public let special: SpecialId
        public let specialCounts: [Int]
        public let bossKillCounts: [Int]
        public let bossKillCountsTotal: Int
        public let uniform: SkinType
        public let species: SpeciesType

        init(content: CoopHistoryDetailQuery.MemberResult, results: [CoopHistoryDetailQuery.EnemyResult]) {
            self.id = content.player.id
            self.isMyself = content.player.isMyself
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
            self.ikuraNum = content.deliverCount
            self.deadCount = content.rescuedCount
            self.helpCount = content.rescueCount
            self.weaponList = content.weapons.map({ $0.image.url.asWeaponId() })
            self.special = content.specialWeapon?.id ?? .SpUltraShot
            self.specialCounts = []
            self.bossKillCounts = results.map({ $0.defeatCount })
            self.uniform = content.player.uniform
            self.bossKillCountsTotal = content.defeatEnemyCount
            self.species = content.player.species
        }
    }

    public struct WaveResult: Codable {
        public let id: Int
        public let isClear: Bool
        public let waterLevel: WaterLevelId
        public let eventType: EventId
        public let goldenIkuraNum: Int?
        public let quotaNum: Int?
        public let goldenIkuraPopNum: Int
    }

    public struct JobResult: Codable {
        public let isClear: Bool
        public let failureWave: Int?
        public let isBossDefeated: Bool?
    }

    public struct Nameplate: Codable {
        public let badges: [BadgeId?]
        public let background: Background
    }

    public struct Background: Codable {
        public let textColor: Common.TextColor
        public let id: NameplateId
    }

//    public init(content: CoopHistoryDetailQuery.Response) {
//
//    }
}
