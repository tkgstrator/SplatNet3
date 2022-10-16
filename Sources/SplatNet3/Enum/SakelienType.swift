//
//  SakelienType.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/08/13.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Foundation

public enum SakelienType: RawRepresentables {
    public init?(id: Int) {
        self.init(SakelienId(rawValue: id))
    }

    public init?(hash: String) {
        self.init(SakelienKey(rawValue: hash))
    }

    public subscript<V>(dynamicMember keyPath: KeyPath<SakelienId, V>) -> V? {
      self[keyPath]
    }

    public subscript<V>(dynamicMember keyPath: KeyPath<SakelienKey, V>) -> V? {
      self[keyPath]
    }

    public var localizedText: String {
        return NSLocalizedString(self.sha256Hash ?? "Unknown Value", bundle: .main, comment: "")
    }

    case SakelienBomber
    case SakelienCupTwins
    case SakelienShield
    case SakelienSnake
    case SakelienTower
    case Sakediver
    case Sakerocket
    case SakePillar
    case SakeDolphin
    case SakeArtillery
    case SakeSaucer
    case SakelienGolden
    case SakeBigMouth
    case Sakedozer
    case SakelienGiant
}

public enum SakelienId: Int, CaseIterable, Codable {
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

public enum SakelienKey: String, CaseIterable, Codable {
    public var sha256Hash: String { rawValue }

    case SakelienBomber     = "f59fe344bd941f90dc8d3458ffd29b6586c1cffd00864967e7766a5a931dc4f6"
    case SakelienCupTwins   = "03c31763738c5628db6d8e7dd3ba0fd2fcb79a1f47694488b51969375148edde"
    case SakelienShield     = "3a3e2c87b96b92e31ffc59a273b7d6aca20f9941e05ad84d6ae26092a627aa34"
    case SakelienSnake      = "999097a0908a4560f05a16e3f97c07b5d10bed22bee6d2ce0eedb2e6a6dcb9d0"
    case SakelienTower      = "2d740da6f03364c3c289625455374f734fd8a96b25c26fde13912e90f3aea68c"
    case Sakediver          = "fd5abb7a9087c528e45a7a4e29c9c03d673b69d6f0ba2f424f6df8b732d9919a"
    case Sakerocket         = "faed7977b2144ac5979de0ca7d23aefd507e517c3fbe19431054ac5a6ba300fa"
    case SakePillar         = "fb4851c75f62b8b50d9bac2128d6ef1c703c7884b63402762ddf78c1555e364a"
    case SakeDolphin        = "dbbf89da359fd880db49730ecc4f66150b148274aa005e22c1152cbf1a45e378"
    case SakeArtillery      = "2c7a648b4c73f291b5ede9c55f33d4e3f99c263d3a27ef3d2eb2a96d328d66ac"
    case SakeSaucer         = "2185696079cc39328cd69f0570e219f09b61d4a56508260fe97b16347ae8a55f"
    case SakelienGolden     = "a35aa2982499e9a404fdb81f72fbaf553bc47f7682cc67f9b8c32ca9910e2cbf"
    case SakeBigMouth       = "f0dd8c7eb5c2e96f347564cac71affe055f6c45a3339145ecc81287f800759d2"
    case Sakedozer          = "8cd6dd3e1bb480e2897afdb434315bc78876204a0995c1552084e1d3edfe0536"
    case SakelienGiant      = "9bc1c1d0341a2049db2ae54546b7335074dda0d2ea88f32c1499771850b7a904"
}
