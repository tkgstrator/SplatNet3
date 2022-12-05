//
//  UnsafeDecoding.swift
//  
//
//  Created by devonly on 2022/12/06.
//

import Foundation

extension BadgeId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = Self(rawValue: rawValue) ?? .CatalogueLevel_Lv00
    }
}

extension BadgeKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = Self(rawValue: rawValue) ?? .CatalogueLevel_Lv00
    }
}

extension NameplateId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = Self(rawValue: rawValue) ?? .Npl_Catalog_Season01_Lv01
    }
}

extension NameplateKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = Self(rawValue: rawValue) ?? .Npl_Catalog_Season01_Lv01
    }
}

extension WeaponId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = Self(rawValue: rawValue) ?? .Random_Green
    }
}

extension WeaponKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = Self(rawValue: rawValue) ?? .Random_Green
    }
}

extension EnemyId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = Self(rawValue: rawValue) ?? .SakelienGiant
    }
}

extension EnemyKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = Self(rawValue: rawValue) ?? .SakelienGiant
    }
}

extension SpecialId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = Self(rawValue: rawValue) ?? .SpUltraShot
    }
}

extension SpecialKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = Self(rawValue: rawValue) ?? .SpUltraShot
    }
}

extension SkinInfoId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = Self(rawValue: rawValue) ?? .COP001
    }
}

extension SkinInfoKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = Self(rawValue: rawValue) ?? .COP001
    }
}

extension VsModeId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = Self(rawValue: rawValue) ?? .UNKNOWN
    }
}

extension VsModeKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = Self(rawValue: rawValue) ?? .UNKNOWN
    }
}

extension VsStageId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = Self(rawValue: rawValue) ?? .Stage00
    }
}

extension VsStageKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = Self(rawValue: rawValue) ?? .Stage00
    }
}

extension GearInfoKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = Self(rawValue: rawValue) ?? .Clt_AMB000
    }
}

extension RuleType {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = Self(rawValue: rawValue) ?? .UNKNOWN
    }
}

extension ModeType {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = Self(rawValue: rawValue) ?? .UNKNOWN
    }
}

extension SpeciesType {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue: String = try container.decode(String.self)
        self = Self(rawValue: stringValue) ?? .UNKNOWN
    }
}
