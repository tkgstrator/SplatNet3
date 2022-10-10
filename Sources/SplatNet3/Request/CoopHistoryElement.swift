//
//  CoopHistory.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire
import Common

public struct CoopHistoryElement: Codable {
    internal init(
        id: String,
        weaponList: [WeaponType],
        stage: StageType,
        startTime: String?,
        endTime: String?,
        mode: Common.Mode,
        rule: Common.Rule
    ) {
        self.id = id
        self.weaponList = weaponList
        self.stage = stage
        self.startTime = startTime
        self.endTime = endTime
        self.mode = mode
        self.rule = rule
    }

    /// 識別ID
    public let id: String
    /// 支給ブキ
    public let weaponList: [WeaponType]
    /// ステージ
    public let stage: StageType
    /// 開始時間
    public let startTime: String?
    /// 終了時間
    public let endTime: String?
    /// モード
    public let mode: Common.Mode
    /// ルール
    public let rule: Common.Rule
}

extension Array where Element == CoopHistory.HistoryGroupsNode {
    func asElement() -> [CoopHistoryElement] {
        self.flatMap({ groupNode -> [CoopHistoryElement] in
            let startTime: String? = groupNode.startTime
            let endTime: String? = groupNode.endTime
            let rule: Common.Rule = groupNode.rule
            let mode: Common.Mode = groupNode.mode
            return groupNode.historyDetails.nodes.compactMap({ node in
                CoopHistoryElement(
                    id: node.id,
                    weaponList: node.weapons.compactMap({ WeaponType(hash: $0.image.url) }),
                    stage: StageType(id: node.coopStage.id) ?? .Unknown,
                    startTime: startTime,
                    endTime: endTime,
                    mode: mode,
                    rule: rule
                )
            })
        })
    }
}
