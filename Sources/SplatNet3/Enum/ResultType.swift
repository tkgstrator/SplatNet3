//
//  ResultType.swift
//  
//
//  Created by devonly on 2022/12/03.
//

import Foundation

public enum IdType: String, CaseIterable, Codable, Identifiable {
    public var id: String { rawValue }
    case CoopHistoryDetail
    case CoopPlayer
}
