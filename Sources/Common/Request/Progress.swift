//
//  Progress.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import SwiftUI

struct Progress: Identifiable {
    let id: UUID = UUID()
    let path: SPEndpoint
    var color: Color {
        self.path.color
    }
    var type: ProgressAPIType {
        self.path.type
    }
    fileprivate(set) var progress: ProgressType = .PROGRESS

    init<T: RequestType>(_ request: T) {
        self.path = SPEndpoint(request: request)
    }
}

extension Array where Element == Progress {
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
