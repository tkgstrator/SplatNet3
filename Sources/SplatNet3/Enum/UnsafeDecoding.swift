//
//  UnsafeDecoding.swift
//  
//
//  Created by devonly on 2022/12/06.
//

import Foundation

fileprivate func unsafeEnumCast<T: RawRepresentable>(rawValue: T.RawValue, defaultValue: T) -> T{
    if let value: T = T(rawValue: rawValue) {
        return value
    }
    SwiftyLogger.error(DecodingError.valueNotFound(T.self, .init(codingPath: [], debugDescription: "Given value \(rawValue) could not cast as \(T.self)")))
    return defaultValue
}

extension BadgeId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .CatalogueLevel_Lv00)
    }
}

extension BadgeKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .CatalogueLevel_Lv00)
    }
}

extension NameplateId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .Npl_Catalog_Season01_Lv01)
    }
}

extension NameplateKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .Npl_Catalog_Season01_Lv01)
    }
}

extension WeaponId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .Random_Green)
    }
}

extension WeaponKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .Random_Green)
    }
}

extension EnemyId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .SakelienGiant)
    }
}

extension EnemyKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .SakelienGiant)
    }
}

extension SpecialId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .SpUltraShot)
    }
}

extension SpecialKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .SpUltraShot)
    }
}

extension SkinInfoId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .COP001)
    }
}

extension SkinInfoKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .COP001)
    }
}

extension VsModeId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .UNKNOWN)
    }
}

extension VsModeKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .UNKNOWN)
    }
}

extension VsStageId {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: Int = try container.decode(Int.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .Stage00)
    }
}

extension VsStageKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .Stage00)
    }
}

extension GearInfoKey {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .Clt_AMB000)
    }
}

extension RuleType {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .UNKNOWN)
    }
}

extension ModeType {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .UNKNOWN)
    }
}

extension SpeciesType {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue: String = try container.decode(String.self)
        self = unsafeEnumCast(rawValue: rawValue, defaultValue: .UNKNOWN)
    }
}
