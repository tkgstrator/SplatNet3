//
//  SwiftUI+Text.swift
//  
//
//  Created by devonly on 2022/11/27.
//

import Foundation
import SwiftUI

public extension Text {
    init(bundle: LocalizedType) {
        self.init(NSLocalizedString(bundle.rawValue, bundle: .module, comment: ""))
    }

    /// 称号をテキストに変換
    init(_ value: GradeId?) {
        if let value = value {
            self.init(NSLocalizedString("Grade_0\(value.id)", bundle: .module, comment: ""))
        } else {
            self.init("-")
        }
    }

    /// 任意のオプショナル型を変換
    init<T: LosslessStringConvertible>(_ value: T?) {
        if let value = value {
            self.init(verbatim: String(value))
        } else {
            self.init("-")
        }
    }

    init(_ value: CoopStageId) {
        if let index: Int = CoopStageId.allCases.firstIndex(of: value) {
            self.init(NSLocalizedString(CoopStageKey.allCases[index].rawValue, bundle: .module, comment: ""))
        } else {
            self.init(NSLocalizedString(CoopStageKey.Unknown.rawValue, bundle: .module, comment: ""))
        }
    }

//    init<T: RawRepresentable>(_ value: T?) where T.RawValue == String {
//
//    }
}

public extension Image {
    init(_ value: CoopStageId) {
        self.init("CoopStage/\(value.rawValue)", bundle: .module)
    }

    init(_ value: WeaponId) {
        self.init("Weapons/\(value.rawValue)", bundle: .module)
    }

    init(_ value: EnemyId) {
        self.init("Enemies/\(value.rawValue)", bundle: .module)
    }
}
