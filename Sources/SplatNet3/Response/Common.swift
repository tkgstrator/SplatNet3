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

    // MARK: - ResultId
    public struct ResultId: Codable, CustomStringConvertible, Equatable {
        public let resultType: ResultType
        public let prefix: String
        public let uid: String
        public let playTime: Date
        public let codes: [String]

        public var description: String {
            let playTime: String = Common.dateFormatter.string(from: playTime)
            let code: String = codes.joined(separator: "-")
            return "\(resultType.rawValue)-\(prefix)-\(uid):\(playTime)_\(code)".base64EncodedString
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            guard let stringValue = try container.decode(String.self).base64DecodedString else {
                throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Could not decoded."))
            }
            guard let rawValue: String = stringValue.capture(pattern: #"^([A-z]*)-"#, group: 1),
                  let resultType: ResultType = ResultType(rawValue: rawValue),
                  let prefix: String = stringValue.capture(pattern: #"-([A-z]*)-"#, group: 1),
                  let uid: String = stringValue.capture(pattern: #"-([A-z0-9]*):"#, group: 1),
                  let playTime: String = stringValue.capture(pattern: #":([A-z0-9].*?)_"#, group: 1),
                  let playTime: Date = Common.dateFormatter.date(from: playTime),
                  let codes: String = stringValue.capture(pattern: #"_([a-z0-9\-].*)"#, group: 1)
            else {
                throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Could not decoded."))
            }

            self.resultType = resultType
            self.prefix = prefix
            self.uid = uid
            self.playTime = playTime
            self.codes = codes.components(separatedBy: "-").map({ String($0) })
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
        public let a: Double
        public let b: Double
        public let g: Double
        public let r: Double
    }
}
