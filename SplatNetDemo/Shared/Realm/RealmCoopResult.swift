//
//  RealmCoopResult.swift
//  SplatNetDemo
//
//  Created by devonly on 2022/11/27.
//

import Foundation
import RealmSwift
3

final class RealmCoopResult: Object, Identifiable, Codable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var salmonId: Int?
    @Persisted var gradePoint: Int?
    @Persisted var grade: GradeId?
    @Persisted var isClear: Bool
    @Persisted var failureWave: Int?
    @Persisted var isBossDefeated: Bool?
    @Persisted var ikuraNum: Int
    @Persisted var goldenIkuraNum: Int
    @Persisted var goldenIkuraAssistNum: Int
    @Persisted var bossCounts: List<Int>
    @Persisted var bossKillCounts: List<Int>
    @Persisted var dangerRate: Decimal128
    @Persisted var jobRate: Decimal128?
    @Persisted var jobScore: Int?
    @Persisted var kumaPoint: Int?
    @Persisted var jobBonus: Int?
    @Persisted var smellMeter: Int?
    @Persisted var waves: List<RealmCoopWave>
    @Persisted var players: List<RealmCoopPlayer>
    @Persisted var scale: List<Int?>
    @Persisted var playTime: Date
    @Persisted var scenarioCode: String?
    @Persisted(originProperty: "results") private var link: LinkingObjects<RealmCoopSchedule>

    override init() {
        super.init()
    }

    convenience init(content: CoopResult) {
        self.init()
        self.id = content.id
        self.grade = content.grade
        self.gradePoint = content.gradePoint
        self.isClear = content.jobResult.isClear
        self.failureWave = content.jobResult.failureWave
        self.isBossDefeated = content.jobResult.isBossDefeated
        self.ikuraNum = content.ikuraNum
        self.goldenIkuraNum = content.goldenIkuraNum
        self.goldenIkuraAssistNum = content.goldenIkuraAssistNum
        self.bossCounts.append(objectsIn: content.bossCounts)
        self.bossKillCounts.append(objectsIn: content.bossKillCounts)
        self.dangerRate = Decimal128(floatLiteral: content.dangerRate)
        self.jobRate = {
            if let jobRate = jobRate {
                return Decimal128(value: jobRate)
            }
            return nil
        }()
        self.jobScore = content.jobScore
        self.kumaPoint = content.kumaPoint
        self.jobBonus = content.jobBonus
        self.smellMeter = content.smellMeter
        self.waves.append(objectsIn: content.waveDetails.map({ RealmCoopWave(content: $0) }))
        self.players.append(objectsIn: ([content.myResult] + content.otherResults).map({ RealmCoopPlayer(content: $0) }))
        self.playTime = content.playTime
        self.scale.append(objectsIn: content.scale)
        self.scenarioCode = content.scenarioCode
    }

    enum CodingKeys: String, CodingKey {
        case id
        case salmonId
        case grade
        case gradePoint
        case isClear
        case failureWave
        case isBossDefeated
        case ikuraNum
        case goldenIkuraNum
        case goldenIkuraAssitNum
        case bossCounts
        case bossKillCounts
        case dangerRate
        case jobRate
        case jobScore
        case kumaPoint
        case jobBonus
        case waves
        case players
        case playTime
        case scale
        case scenarioCode
    }

    public required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.salmonId = try container.decodeIfPresent(Int.self, forKey: .salmonId)
        self.grade = try container.decodeIfPresent(GradeId.self, forKey: .grade)
        self.gradePoint = try container.decodeIfPresent(Int.self, forKey: .gradePoint)
        self.isClear = try container.decode(Bool.self, forKey: .isClear)
        self.failureWave = try container.decodeIfPresent(Int.self, forKey: .failureWave)
        self.isBossDefeated = try container.decodeIfPresent(Bool.self, forKey: .isBossDefeated)
        self.ikuraNum = try container.decode(Int.self, forKey: .ikuraNum)
        self.goldenIkuraNum = try container.decode(Int.self, forKey: .goldenIkuraNum)
        self.goldenIkuraAssistNum = try container.decode(Int.self, forKey: .goldenIkuraAssitNum)
        self.bossCounts.append(objectsIn: try container.decode([Int].self, forKey: .bossCounts))
        self.bossKillCounts.append(objectsIn: try container.decode([Int].self, forKey: .bossKillCounts))
        self.dangerRate = try container.decode(Decimal128.self, forKey: .dangerRate)
        self.jobRate = try container.decodeIfPresent(Decimal128.self, forKey: .jobRate)
        self.jobScore = try container.decodeIfPresent(Int.self, forKey: .jobScore)
        self.kumaPoint = try container.decodeIfPresent(Int.self, forKey: .kumaPoint)
        self.jobBonus = try container.decodeIfPresent(Int.self, forKey: .jobBonus)
        self.waves.append(objectsIn: try container.decode([RealmCoopWave].self, forKey: .waves))
        self.players.append(objectsIn: try container.decode([RealmCoopPlayer].self, forKey: .players))
        self.playTime = try container.decode(Date.self, forKey: .playTime)
        self.scale.append(objectsIn: try container.decode([Int?].self, forKey: .scale))
        self.scenarioCode = try container.decodeIfPresent(String.self, forKey: .scenarioCode)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(salmonId, forKey: .salmonId)
        try container.encode(id, forKey: .id)
        try container.encode(grade, forKey: .grade)
        try container.encode(gradePoint, forKey: .gradePoint)
        try container.encode(isClear, forKey: .isClear)
        try container.encode(failureWave, forKey: .failureWave)
        try container.encode(isBossDefeated, forKey: .isBossDefeated)
        try container.encode(ikuraNum, forKey: .ikuraNum)
        try container.encode(goldenIkuraNum, forKey: .goldenIkuraNum)
        try container.encode(goldenIkuraAssistNum, forKey: .goldenIkuraAssitNum)
        try container.encode(bossCounts, forKey: .bossCounts)
        try container.encode(bossKillCounts, forKey: .bossKillCounts)
        try container.encode(dangerRate, forKey: .dangerRate)
        try container.encode(jobRate, forKey: .jobRate)
        try container.encode(jobScore, forKey: .jobScore)
        try container.encode(kumaPoint, forKey: .kumaPoint)
        try container.encode(jobBonus, forKey: .jobBonus)
        try container.encode(waves, forKey: .waves)
        try container.encode(players, forKey: .players)
        try container.encode(playTime, forKey: .playTime)
        try container.encode(scale, forKey: .scale)
        try container.encode(scenarioCode, forKey: .scenarioCode)
    }
}

extension GradeId: PersistableEnum {}
