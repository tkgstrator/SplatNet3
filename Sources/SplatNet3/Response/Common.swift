//
//  Common.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation


public enum Common {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter
    }()

    // MARK: - PlayerId
    public struct PlayerId: Codable, CustomStringConvertible, Equatable {
        /// 常にCoopPlayer
        public let id: IdType
        /// 常に自分のID
        public let playerId: String
        /// プレイヤーのID
        public let uid: String
        /// 遊んだ時間
        public let playTime: Date
        /// リザルトごとの固有のID
        public let uuid: String

        public var description: String {
            let playTime: String = Common.dateFormatter.string(from: playTime)
            return "\(id.rawValue)-u-\(playerId):\(playTime)_\(uuid):u-\(uid)"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let stringValue = try {
                let stringValue: String = try container.decode(String.self)
                guard let value: String = stringValue.base64DecodedString else {
                    return stringValue
                }
                return value
            }()
            guard let rawValue: String = stringValue.capture(pattern: #"^([A-z]*)-"#, group: 1),
                  let id: IdType = IdType(rawValue: rawValue),
                  let playTime: String = stringValue.capture(pattern: #":([A-z0-9].*?)_"#, group: 1),
                  let playTime: Date = Common.dateFormatter.date(from: playTime),
                  let playerId: String = stringValue.capture(pattern: #"u-([0-9a-z]*)"#, group: 1),
                  let uid: String = stringValue.capture(pattern: #":u-([0-9a-z]*)"#, group: 1),
                  let uuid: String = stringValue.capture(pattern: #"_([a-z0-9\-].*):"#, group: 1)
            else {
                throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Could not decoded."))
            }

            self.id = id
            self.playTime = playTime
            self.uuid = uuid
            self.playerId = playerId
            self.uid = uid
        }
    }

    // MARK: - ResultId
    public struct ResultId: Codable, CustomStringConvertible, Equatable {
        public let id: IdType
        public let prefix: String
        public let uid: String
        public let playTime: Date
        public let uuid: String

        public var description: String {
            let playTime: String = Common.dateFormatter.string(from: playTime)
            return "\(id.rawValue)-\(prefix)-\(uid):\(playTime)_\(uuid)"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            guard let stringValue = try container.decode(String.self).base64DecodedString else {
                throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Could not decoded."))
            }
            guard let rawValue: String = stringValue.capture(pattern: #"^([A-z]*)-"#, group: 1),
                  let id: IdType = IdType(rawValue: rawValue),
                  let prefix: String = stringValue.capture(pattern: #"-([A-z]*)-"#, group: 1),
                  let uid: String = stringValue.capture(pattern: #"-([A-z0-9]*):"#, group: 1),
                  let playTime: String = stringValue.capture(pattern: #":([A-z0-9].*?)_"#, group: 1),
                  let playTime: Date = Common.dateFormatter.date(from: playTime),
                  let uuid: String = stringValue.capture(pattern: #"_([a-z0-9\-].*)"#, group: 1)
            else {
                throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Could not decoded."))
            }

            self.id = id
            self.prefix = prefix
            self.uid = uid
            self.playTime = playTime
            self.uuid = uuid
        }
    }

    // MARK: - Node
    public struct Node<T: Codable>: Codable {
        public let nodes: [T]
    }

    // MARK: - URL
    public struct URL<T: RawRepresentable>: Codable where T.RawValue == String {
        @SHA256HashRawValue public var url: T
    }

    // MARK: - Image
    public struct Image<T: RawRepresentable>: Codable where T.RawValue == String {
        public let name: String
        public let image: Common.URL<T>
    }

    // MARK: - TextColor
    public struct TextColor: Codable {
        public let a: Decimal
        public let b: Decimal
        public let g: Decimal
        public let r: Decimal
    }
}
