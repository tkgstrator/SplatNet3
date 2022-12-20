//
//  CoopHistory.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum CoopHistory {
    // MARK: - Scale
    public struct Scale: Codable {
        public let gold: Int
        public let silver: Int
        public let bronze: Int
    }

    // MARK: - SPWeapon
    public struct SPWeapon<T: RawRepresentable, S: RawRepresentable>: Codable where T.RawValue == String, S.RawValue == Int, S: Codable {
        public let name: String
        public let weaponId: S
        public let image: Common.URL<T>

        enum CodingKeys: String, CodingKey {
            case name
            case weaponId
            case image
            case id
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decode(String.self, forKey: .name)
            self.weaponId = try {
                if let id: String = try? container.decode(String.self, forKey: .id),
                   let stringValue: String = id.base64DecodedString,
                   let rawValue: String = stringValue.capture(pattern: "([0-9]*)$", group: 1),
                   let intValue: Int = Int(rawValue),
                   let weaponId: S = S(rawValue: intValue)
                {
                    return weaponId
                }
                return try container.decode(S.self, forKey: .weaponId)
            }()
            self.image = try container.decode(Common.URL<T>.self, forKey: .image)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(name, forKey: .name)
            try container.encode(weaponId, forKey: .weaponId)
            try container.encode(image, forKey: .image)
        }
    }

    // MARK: - Content
    public struct Content<T: RawRepresentable, S: RawRepresentable>: Codable where T.RawValue == String, S.RawValue == Int {
        public let name: String
        @IntegerRawValue public var id: S
        public let image: Common.URL<T>
    }

    // MARK: - Element
    public struct Element<T: RawRepresentable>: Codable where T.RawValue == Int {
        public let name: String
        @IntegerRawValue public var id: T
    }

    // MARK: - BossResult
    public struct BossResult: Codable {
        public let hasDefeatBoss: Bool
        public let boss: CoopHistory.Element<EnemyId>
    }

    // MARK: - HistoryDetailElement
    public struct HistoryDetailElement: Codable {
        public let id: Common.ResultId
    }
}
