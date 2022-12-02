//
//  RealmCoopSchedule.swift
//  SplatNetDemo
//
//  Created by devonly on 2022/11/27.
//

import Foundation
import RealmSwift
3

class RealmCoopSchedule: Object, Codable {
    @Persisted(indexed: true) var startTime: Date?
    @Persisted(indexed: true) var endTime: Date?
    @Persisted var stageId: CoopStageId
    @Persisted var weaponList: List<WeaponId>
    @Persisted var results: List<RealmCoopResult>
    @Persisted var rareWeapon: WeaponId?
    @Persisted var rule: RuleType
    @Persisted var mode: ModeType

    override init() {
        super.init()
    }

    convenience init(content: CoopResult.Schedule) {
        self.init()
        self.startTime = content.startTime
        self.endTime = content.endTime
        self.stageId = content.stage
        self.weaponList.append(objectsIn: content.weaponList)
        self.rareWeapon = nil
        self.rule = content.rule
        self.mode = content.mode
    }

    enum CodingKeys: String, CodingKey {
        case startTime
        case endTime
        case stageId
        case weaponList
        case rareWeapon
        case rule
        case mode
        case results
    }

    public required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.startTime = try container.decodeIfPresent(Date.self, forKey: .startTime)
        self.endTime = try container.decodeIfPresent(Date.self, forKey: .endTime)
        self.stageId = try container.decode(CoopStageId.self, forKey: .stageId)
        self.weaponList.append(objectsIn: try container.decode([WeaponId].self, forKey: .weaponList))
        self.results.append(objectsIn: try container.decode([RealmCoopResult].self, forKey: .results))
        self.rareWeapon = try container.decodeIfPresent(WeaponId.self, forKey: .rareWeapon)
        self.rule = try container.decode(RuleType.self, forKey: .rule)
        self.mode = try container.decode(ModeType.self, forKey: .mode)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(startTime, forKey: .startTime)
        try container.encode(endTime, forKey: .endTime)
        try container.encode(stageId, forKey: .stageId)
        try container.encode(weaponList, forKey: .weaponList)
        try container.encode(rareWeapon, forKey: .rareWeapon)
        try container.encode(rule, forKey: .rule)
        try container.encode(mode, forKey: .mode)
        try container.encode(results, forKey: .results)
    }

    static func ==(lhs: RealmCoopSchedule, rhs: RealmCoopSchedule) -> Bool {
        return true
    }

}

extension RealmCoopSchedule {
    override func isEqual(_ object: Any?) -> Bool {
        if let target: RealmCoopSchedule = object as? RealmCoopSchedule {
            return self.stageId == target.stageId &&
            self.rule == target.rule &&
            self.mode == target.mode &&
            Array(self.weaponList) == Array(target.weaponList) &&
            self.startTime == target.startTime &&
            self.endTime == target.endTime
        }
        return false
    }
}

extension WeaponId: PersistableEnum {}

extension RuleType: PersistableEnum {}

extension ModeType: PersistableEnum {}

extension CoopStageId: PersistableEnum {}
