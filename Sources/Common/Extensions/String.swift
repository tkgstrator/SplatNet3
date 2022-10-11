//
//  String.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import CryptoKit
import Foundation

extension String {
    /// 長さ128のランダム文字列を生成する
    public static var randomString: String {
        let letters: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        // swiftlint:disable:next force_unwrapping
        return String((0 ..< 128).map({ _ in letters.randomElement()! }))
    }

    /// Base64文字列に変換する
    public var base64EncodedString: String {
        // swiftlint:disable:next force_unwrapping
        self.data(using: .utf8)!
            .base64EncodedString()
            .replacingOccurrences(of: "=", with: "")
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
    }

    public var sha256Hash: String {
        NSLocalizedString(
            SHA256
               .hash(data: self.data(using: .utf8)!)
               .compactMap({ String(format: "%02x", $0) })
               .joined(),
            bundle: .main,
            comment: ""
        )
    }

    /// Base64文字列から復号する
    public var base64DecodedString: String? {
        let formatedString: String = self + Array(repeating: "=", count: self.count % 4).joined()
        if let data: Data = Data(base64Encoded: formatedString, options: [.ignoreUnknownCharacters]) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }

    /// HMAC-SHA256文字列に変換する
    public var codeChallenge: String {
        Data(SHA256.hash(data: Data(self.utf8))).base64EncodedString()
            .replacingOccurrences(of: "=", with: "")
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
    }

    /// 正規表現でキャプチャする
    public func capture(pattern: String, group: Int) -> String? {
        let result = capture(pattern: pattern, group: [group])
        return result.isEmpty ? nil : result[0]
    }

    /// 正規表現でキャプチャする
    public func capture(pattern: String, group: [Int]) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return []
        }
        guard let matched = regex.firstMatch(in: self, range: NSRange(location: 0, length: self.count)) else {
            return []
        }
        return group.map { group -> String in
            (self as NSString).substring(with: matched.range(at: group))
        }
    }

    /// 文字列をBase64復号して遊んだ時間をUnixTimestampで返す
    public var playTime: Int {
        let formatter: ISO8601DateFormatter = {
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [
                .withDay,
                .withMonth,
                .withYear,
                .withTime,
            ]
            return formatter
        }()

        if let decodedString: String = self.base64DecodedString,
           let playTime: String = decodedString.capture(pattern: #":(\d{8}T\d{6})_"#, group: 1),
           let timeInterval: TimeInterval = formatter.date(from: playTime)?.timeIntervalSince1970 {
            return Int(timeInterval)
        }
        return 0
    }
}
