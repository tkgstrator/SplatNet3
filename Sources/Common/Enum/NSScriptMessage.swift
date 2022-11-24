//
//  NSScriptMessage.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import WebKit

enum NSScriptMessage {
    case closeWebView
    case reloadExtension
    case completeLoading
    case invokeNativeShare(ShareImg)
    case invokeNativeShareUrl(ShareURL)
    case copyToClipboard(String)
    case downloadImages([URL])

    init?(rawValue: Any?) {
        guard let rawValue: String = rawValue as? String,
              let data: Data = rawValue.data(using: .utf8)
        else {
            return nil
        }

        if let script: NSScriptMessageName = NSScriptMessageName(rawValue: rawValue) {
            switch script {
            case .closeWebView:
                /// closeWebView
                self = .closeWebView
                return
            case .reloadExtension:
                /// reloadExtension
                self = .reloadExtension
                return
            case .completeLoading:
                /// completeLoading
                self = .completeLoading
                return
            default:
                break
            }
        }

        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        /// invokeNativeShareUrl
        if let shareURL: ShareURL = try? decoder.decode(ShareURL.self, from: data) {
            self = .invokeNativeShareUrl(shareURL)
            return
        }

        /// invokeNativeShare
        if let shareImg: ShareImg = try? decoder.decode(ShareImg.self, from: data) {
            self = .invokeNativeShare(shareImg)
            return
        }

        /// copyToClipboard
        if let code: String = rawValue.capture(pattern: #"([A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4})"#, group: 1) {
            self = .copyToClipboard(code)
            return
        }

        /// downloadImages
        let imageURLs: [URL] = rawValue.capture(pattern: #"(https://[^,^\]]*)"#).compactMap({ URL(string: $0) })
        if !imageURLs.isEmpty {
            self = .downloadImages(imageURLs)
            return
        }

        return nil
    }

    struct ShareURL: Codable {
        let text: String
        let imageUrl: URL
        let hashtags: [String]

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.text = try container.decode(String.self, forKey: .text)
            self.imageUrl = try container.decode(URL.self, forKey: .imageUrl)
            self.hashtags = try container.decode([String].self, forKey: .hashtags)
        }
    }

    struct ShareImg: Codable {
        let text: String
        let url: URL

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.text = try container.decode(String.self, forKey: .text)
            self.url = try container.decode(URL.self, forKey: .url)
        }
    }
}

enum NSScriptMessageName: String, CaseIterable {
    case closeWebView
    case reloadExtension
    case completeLoading
    case invokeNativeShare
    case invokeNativeShareUrl
    case copyToClipboard
    case downloadImages
}
