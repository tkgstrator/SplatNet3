//
//  Common.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation
import Common

public enum Common {
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
}
