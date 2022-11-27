//
//  RealmCoopPlayer.swift
//  SplatNetDemo
//
//  Created by devonly on 2022/11/27.
//

import Foundation
import RealmSwift
import SplatNet3

final class RealmCoopPlayer: Object, Identifiable, Codable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String
    @Persisted var byname: String
    @Persisted var nameId: String
    @Persisted var isMyself: Bool
    @Persisted var deadCount: Int
    @Persisted var helpCount: Int
    @Persisted var goldenIkuraNum: Int
    @Persisted var ikuraNum: Int
    @Persisted var goldenIkuraAssistNum: Int
    @Persisted var specialId: SpecialId
    @Persisted var species: SpeciesType
    @Persisted var bossKillCountsTotal: Int
    @Persisted var bossKillCounts: List<Int>
    @Persisted var specialCounts: List<Int>
    @Persisted var badges: List<BadgeId?>
    @Persisted var background: NameplateId
    @Persisted var weaponList: List<WeaponId>
    @Persisted var uniform: SkinInfoId
    @Persisted(originProperty: "players") private var link: LinkingObjects<RealmCoopResult>

    override init() {
        super.init()
    }

    convenience init(content: CoopResult.PlayerResult) {
        self.init()
        self.id = content.id
        self.name = content.name
        self.byname = content.byname
        self.nameId = content.nameId
        self.isMyself = content.isMyself
        self.deadCount = content.deadCount
        self.helpCount = content.helpCount
        self.goldenIkuraNum = content.goldenIkuraNum
        self.goldenIkuraAssistNum = content.goldenIkuraNum
        self.ikuraNum = content.ikuraNum
        self.specialId = content.special
        self.species = content.species
        self.specialCounts.append(objectsIn: content.specialCounts)
        self.bossKillCounts.append(objectsIn: content.bossKillCounts)
        self.bossKillCountsTotal = content.bossKillCountsTotal
        self.badges.append(objectsIn: content.nameplate.badges)
        self.background = content.nameplate.background.id
        self.uniform = content.uniform
        self.weaponList.append(objectsIn: content.weaponList)
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case byname
        case nameId
        case isMyself
        case deadCount
        case helpCount
        case goldenIkuraNum
        case goldenIkuraAssistNum
        case ikuraNum
        case specialId
        case species
        case specialCounts
        case bossKillCounts
        case bossKillCountsTotal
        case badges
        case background
        case uniform
        case weaponList
    }

    public required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.byname = try container.decode(String.self, forKey: .byname)
        self.nameId = try container.decode(String.self, forKey: .nameId)
        self.isMyself = try container.decode(Bool.self, forKey: .isMyself)
        self.deadCount = try container.decode(Int.self, forKey: .deadCount)
        self.helpCount = try container.decode(Int.self, forKey: .helpCount)
        self.goldenIkuraNum = try container.decode(Int.self, forKey: .goldenIkuraNum)
        self.goldenIkuraAssistNum = try container.decode(Int.self, forKey: .goldenIkuraAssistNum)
        self.ikuraNum = try container.decode(Int.self, forKey: .ikuraNum)
        self.specialId = try container.decode(SpecialId.self, forKey: .specialId)
        self.species = try container.decode(SpeciesType.self, forKey: .species)
        self.specialCounts.append(objectsIn: try container.decode([Int].self, forKey: .specialCounts))
        self.bossKillCounts.append(objectsIn: try container.decode([Int].self, forKey: .bossKillCounts))
        self.bossKillCountsTotal = try container.decode(Int.self, forKey: .bossKillCountsTotal)
        self.badges.append(objectsIn: try container.decode([BadgeId?].self, forKey: .badges))
        self.background = try container.decode(NameplateId.self, forKey: .background)
        self.uniform = try container.decode(SkinInfoId.self, forKey: .uniform)
        self.weaponList.append(objectsIn: try container.decode([WeaponId].self, forKey: .weaponList))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(byname, forKey: .byname)
        try container.encode(nameId, forKey: .nameId)
        try container.encode(isMyself, forKey: .isMyself)
        try container.encode(deadCount, forKey: .deadCount)
        try container.encode(helpCount, forKey: .helpCount)
        try container.encode(goldenIkuraNum, forKey: .goldenIkuraNum)
        try container.encode(goldenIkuraAssistNum, forKey: .goldenIkuraAssistNum)
        try container.encode(ikuraNum, forKey: .ikuraNum)
        try container.encode(specialId, forKey: .specialId)
        try container.encode(species, forKey: .species)
        try container.encode(specialCounts, forKey: .specialCounts)
        try container.encode(bossKillCounts, forKey: .bossKillCounts)
        try container.encode(bossKillCountsTotal, forKey: .bossKillCountsTotal)
        try container.encode(badges, forKey: .badges)
        try container.encode(background, forKey: .background)
        try container.encode(uniform, forKey: .uniform)
        try container.encode(weaponList, forKey: .weaponList)
    }
}

extension BadgeId: PersistableEnum {}

extension SpeciesType: PersistableEnum {}

extension SpecialId: PersistableEnum {}

extension NameplateId: PersistableEnum {}

extension SkinInfoId: PersistableEnum {}
