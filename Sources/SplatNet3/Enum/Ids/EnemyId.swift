//
//  EnemyId.swift
//  
//
//  Created by devonly on 2022/11/24.
//

import Foundation

public enum EnemyId: Int, CaseIterable, Identifiable, Codable {
    public var id: Int { rawValue }

    case SakelienBomber     = 4
    case SakelienCupTwins   = 5
    case SakelienShield     = 6
    case SakelienSnake      = 7
    case SakelienTower      = 8
    case Sakediver          = 9
    case Sakerocket         = 10
    case SakePillar         = 11
    case SakeDolphin        = 12
    case SakeArtillery      = 13
    case SakeSaucer         = 14
    case SakelienGolden     = 15
    case SakeBigMouth       = 20
    case Sakedozer          = 17
    case SakelienGiant      = 23
}
