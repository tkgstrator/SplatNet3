//
//  UnknownIterable.swift
//  
//
//  Created by devonly on 2022/11/26.
//

import Foundation

//public protocol UnknownIterable: CaseIterable, Codable, Identifiable, CaseIterable, RawRepresentable where RawValue == String {
//}
//
//extension UnknownIterable {
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        let rawValue: String = try container.decode(String.self)
//        guard let value: Self = Self(rawValue: rawValue) else {
//            throw DecodingError.typeMismatch(Self.self, .init(codingPath: container.codingPath, debugDescription: "Given value \(rawValue) could not associated for \(Self.self)"))
//        }
//        self = value
//    }
//}

