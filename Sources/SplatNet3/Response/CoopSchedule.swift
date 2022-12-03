//
//  CoopSchedule.swift
//  
//
//  Created by devonly on 2022/12/03.
//

import Foundation

public struct CoopSchedule: Codable {
    public let stageId: CoopStageId
    public let startTime: Date
    public let endTime: Date
    public let weaponList: [WeaponId]
    public let rareWeapon: WeaponId?
    public let mode: ModeType
    public let rule: RuleType

    init(schedule: StageScheduleQuery.CoopSchedule) {
        self.stageId = schedule.setting.coopStage.id
        self.startTime = schedule.startTime
        self.endTime = schedule.endTime
        self.mode = .REGULAR
        self.rule = .REGULAR
        self.weaponList = schedule.setting.weapons.map({ $0.image.url.asWeaponId() })
        self.rareWeapon = nil
    }
}
