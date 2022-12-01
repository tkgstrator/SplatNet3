//
//  SPProgress.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import SwiftUI

public struct SPProgress: Identifiable {
    public let id: UUID = UUID()
    public let path: SPEndpoint
    public var color: Color {
        self.path.color
    }
    public var type: ProgressAPIType {
        self.path.type
    }
    public var progress: ProgressType = .PROGRESS

    init<T: RequestType>(_ request: T) {
        self.path = SPEndpoint(request: request)
    }

    public init(_ endpoint: SPEndpoint) {
        self.path = endpoint
    }
}

public extension Array where Element == SPProgress {
    /// 通信成功
    mutating func success() {
        if let index: Int = self.lastIndex(where: { $0.progress == .PROGRESS }) {
            self[index].progress = .SUCCESS
        }
    }

    /// 通信失敗
    mutating func failure() {
        if let index: Int = self.lastIndex(where: { $0.progress == .PROGRESS }) {
            self[index].progress = .FAILURE
        }
    }
}
