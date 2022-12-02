//
//  RealmCoopWave.swift
//  SplatNetDemo
//
//  Created by devonly on 2022/11/27.
//

import Foundation
import RealmSwift
3

final class RealmCoopWave: Object, Identifiable, Codable {
    @Persisted var id: Int
    @Persisted var isClear: Bool
    @Persisted(indexed: true) var waterLevel: WaterLevelId
    @Persisted(indexed: true) var eventType: EventId
    @Persisted var goldenIkuraNum: Int?
    @Persisted var quotaNum: Int?
    @Persisted var goldenIkuraPopNum: Int
    @Persisted(originProperty: "waves") private var link: LinkingObjects<RealmCoopResult>

    override init() {
        super.init()
    }

    convenience init(content: CoopResult.WaveResult) {
        self.init()
        self.id = content.id
        self.isClear = content.isClear
        self.waterLevel = content.waterLevel
        self.eventType = content.eventType
        self.goldenIkuraNum = content.goldenIkuraNum
        self.quotaNum = content.quotaNum
        self.goldenIkuraPopNum = content.goldenIkuraPopNum
    }

    public required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(Int.self, forKey: .id)
        self.isClear = try container.decode(Bool.self, forKey: .isClear)
        self.waterLevel = try container.decode(WaterLevelId.self, forKey: .waterLevel)
        self.eventType = try container.decode(EventId.self, forKey: .eventType)
        self.goldenIkuraNum = try container.decodeIfPresent(Int.self, forKey: .goldenIkuraNum)
        self.goldenIkuraPopNum = try container.decode(Int.self, forKey: .goldenIkuraPopNum)
        self.quotaNum = try container.decodeIfPresent(Int.self, forKey: .quotaNum)
    }

    enum CodingKeys: String, CodingKey {
        case id
        case isClear
        case waterLevel
        case eventType
        case goldenIkuraNum
        case quotaNum
        case goldenIkuraPopNum
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(isClear, forKey: .isClear)
        try container.encode(waterLevel, forKey: .waterLevel)
        try container.encode(eventType, forKey: .eventType)
        try container.encode(goldenIkuraNum, forKey: .goldenIkuraNum)
        try container.encode(goldenIkuraPopNum, forKey: .goldenIkuraPopNum)
        try container.encode(quotaNum, forKey: .quotaNum)
    }
}

/// RealmSwift.List
extension RealmSwift.List where Element: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(contentsOf: self)
    }
}

extension LinkingObjects: Codable where Element: Codable {
    public init(from decoder: Decoder) throws {
        fatalError()
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self)
    }
}

extension WaterLevelId: PersistableEnum {}

extension EventId: PersistableEnum {}
