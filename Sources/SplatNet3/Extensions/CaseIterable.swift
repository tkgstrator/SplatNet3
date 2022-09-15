//
//  CaseIterable.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/08/13.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Foundation

public extension CaseIterable where Self: Equatable {
    var offset: AllCases.Index {
        Self.allCases.firstIndex(of: self)!
    }
}

/// 二つのRawValueで初期化できるEnum
@dynamicMemberLookup
public protocol RawRepresentables: Codable, CaseIterable, Equatable {
    init?<T>(_ object: T?) where T: CaseIterable, T.AllCases.Index == AllCases.Index, T: Equatable

    subscript<T, V>(dynamicMember keyPath: KeyPath<T, V>) -> V? where T: CaseIterable, T.AllCases.Index == AllCases.Index, T: Equatable { get }
}

public extension RawRepresentables {
    init?<T>(_ object: T?) where T: CaseIterable, T.AllCases.Index == AllCases.Index, T: Equatable {
      switch object {
      case let object? where object.offset < Self.allCases.endIndex:
        self = Self.allCases[object.offset]

      case _:
        return nil
      }
    }

    subscript<T, V>(dynamicMember keyPath: KeyPath<T, V>) -> V? where T: CaseIterable, T.AllCases.Index == AllCases.Index, T: Equatable {
        self[keyPath]
    }

    subscript<T, V>(_ keyPath: KeyPath<T, V>) -> V? where T: CaseIterable, T.AllCases.Index == AllCases.Index {
      (offset < T.allCases.endIndex) ? T.allCases[offset][keyPath: keyPath] : nil
    }
}
