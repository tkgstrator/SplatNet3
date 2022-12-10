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
    static var randomString: String {
        let letters: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        // swiftlint:disable:next force_unwrapping
        return String((0 ..< 128).map({ _ in letters.randomElement()! }))
    }

    /// Base64文字列に変換する
    var base64EncodedString: String {
        // swiftlint:disable:next force_unwrapping
        self.data(using: .utf8)!
            .base64EncodedString()
            .replacingOccurrences(of: "=", with: "")
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
    }

    var sha256Hash: String {
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
    var codeChallenge: String {
        Data(SHA256.hash(data: Data(self.utf8))).base64EncodedString()
            .replacingOccurrences(of: "=", with: "")
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
    }

    /// 正規表現でマッチングする
    public func capture(pattern: String, group: Int) -> String? {
        capture(pattern: pattern, group: [group]).first
    }

    /// 正規表現でマッチングする
    public func capture(pattern: String, group: [Int]) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return []
        }
        guard let matches = regex.firstMatch(in: self, range: NSRange(location: 0, length: self.count)) else {
            return []
        }
        return group.map { group -> String in
            (self as NSString).substring(with: matches.range(at: group))
        }
    }

    /// 正規表現でマッチングする
    public func capture(pattern: String) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return []
        }

        let matches: [NSTextCheckingResult] = regex.matches(in: self, range: NSRange(location: 0, length: self.count))

        return matches.map({ match in
            (self as NSString).substring(with: match.range)
        })
    }

    public init(format: String, _ arguments: CVarArg?) {
        if let arguments = arguments {
            self.init(format: format, arguments)
        } else {
            self.init("-")
        }
    }
}
