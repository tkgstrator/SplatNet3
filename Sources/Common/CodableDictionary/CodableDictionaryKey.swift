/* *************************************************************************************************
 CodableDictionaryKey.swift
   © 2020 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */


/// A type that can be a key of `CodableDictionary`.
public protocol CodableDictionaryKey: Hashable, CodingKey {}

// Note: `extension CodableDictionaryKey where Self: LosslessStringConvertible` will cause ambiguity errors.

extension CodableDictionaryKey where Self: FixedWidthInteger {
  public var description: String {
    // Workaround for https://github.com/YOCKOW/SwiftCodableDictionary/issues/2
    func __description<B>(_ int: B) -> String where B: BinaryInteger {
      return int.description
    }
    return __description(self)
  }

  public var stringValue: String {
    return String(self, radix: 10)
  }

  public var intValue: Int? {
    guard Int.min <= self && self <= Int.max else { return nil }
    return Int(self)
  }

  public init?(stringValue: String) {
    self.init(stringValue)
  }

  public init?(intValue: Int) {
    guard Self.min <= intValue && intValue <= Self.max else { return nil }
    self.init(intValue)
  }
}

extension CodableDictionaryKey where Self: RawRepresentable, Self.RawValue: CodableDictionaryKey {
  public var stringValue: String {
    return self.rawValue.stringValue
  }

  public var intValue: Int? {
    return self.rawValue.intValue
  }

  public init?(stringValue: String) {
    guard let rawValue = Self.RawValue(stringValue: stringValue) else { return nil }
    self.init(rawValue: rawValue)
  }

  public init?(intValue: Int) {
    guard let rawValue = Self.RawValue(intValue: intValue) else { return nil }
    self.init(rawValue: rawValue)
  }
}

// Requires this because of https://github.com/apple/swift/blob/master/lib/Sema/DerivedConformanceCodingKey.cpp
extension CodableDictionaryKey where Self: RawRepresentable, Self.RawValue == Int {
  public var stringValue: String {
    return String(self.rawValue)
  }

  public var intValue: Int? {
    return self.rawValue
  }

  public init?(stringValue: String) {
    guard let integer = Int(stringValue) else { return nil }
    self.init(rawValue: integer)
  }

  public init?(intValue: Int) {
    self.init(rawValue: intValue)
  }
}


extension String: CodableDictionaryKey {
  public var stringValue: String {
    return self
  }

  public var intValue: Int? {
    return Int(self)
  }

  public init?(stringValue: String) {
    self = stringValue
  }

  public init?(intValue: Int) {
    self.init(intValue)
  }
}

extension Substring: CodableDictionaryKey {
  public var stringValue: String {
    return String(self)
  }

  public var intValue: Int? {
    return Int(self)
  }

  public init?(stringValue: String) {
    self = stringValue[...]
  }

  public init?(intValue: Int) {
    self.init(stringValue: String(intValue))
  }
}

extension Unicode.Scalar: CodableDictionaryKey {
  public var stringValue: String {
    return String(self)
  }

  public var intValue: Int? {
    return Int(self.stringValue)
  }

  public init?(stringValue: String) {
    // Complexity of `count` of `UnicodeScalarView` is O(n)
    let scalars = stringValue.unicodeScalars
    if scalars.isEmpty { return nil }
    guard scalars.dropFirst().isEmpty else { return nil }
    self = scalars.first!
  }

  public init?(intValue: Int) {
    self.init(stringValue: String(intValue))
  }
}

extension Character: CodableDictionaryKey {
  public var stringValue: String {
    return String(self)
  }

  public var intValue: Int? {
    return Int(self.stringValue)
  }

  public init?(stringValue: String) {
    // Complexity of `count` of `String` is O(n)
    if stringValue.isEmpty { return nil }
    guard stringValue.dropFirst().isEmpty else { return nil }
    self = stringValue.first!
  }

  public init?(intValue: Int) {
    self.init(stringValue: String(intValue))
  }
}

extension Int: CodableDictionaryKey {
  public var intValue: Int? {
    return self
  }

  public init?(intValue: Int) {
    self = intValue
  }
}

extension Int8: CodableDictionaryKey {}

extension Int16: CodableDictionaryKey {}

extension Int32: CodableDictionaryKey {}

extension Int64: CodableDictionaryKey {}

extension UInt8: CodableDictionaryKey {}

extension UInt16: CodableDictionaryKey {}

extension UInt32: CodableDictionaryKey {}

extension UInt64: CodableDictionaryKey {}

extension UInt: CodableDictionaryKey {}

extension Float: CodableDictionaryKey {
  public var stringValue: String {
    return self.description
  }

  public var intValue: Int? {
    return Int(self)
  }

  public init?(stringValue: String) {
    self.init(stringValue)
  }

  public init?(intValue: Int) {
    self.init(intValue)
  }
}

extension Double: CodableDictionaryKey {
  public var stringValue: String {
    return self.description
  }

  public var intValue: Int? {
    return Int(self)
  }

  public init?(stringValue: String) {
    self.init(stringValue)
  }

  public init?(intValue: Int) {
    self.init(intValue)
  }
}

#if arch(i386) || arch(x86_64)
extension Float80: CodableDictionaryKey {
  public var stringValue: String {
    return self.description
  }

  public var intValue: Int? {
    return Int(self)
  }

  public init?(stringValue: String) {
    self.init(stringValue)
  }

  public init?(intValue: Int) {
    self.init(intValue)
  }
}
#endif

extension Bool: CodableDictionaryKey {
  public var stringValue: String {
    return self ? "true" : "false"
  }

  public var intValue: Int? {
    return self ? 1 : 0
  }

  public init?(stringValue: String) {
    // Also supports YAML's Boolean: https://yaml.org/type/bool.html
    switch stringValue.lowercased() {
    case "y", "yes", "true", "on":
      self = true
    case "n", "no", "false", "off":
      self = false
    default:
      return nil
    }
  }

  public init?(intValue: Int) {
    self = intValue != 0
  }
}
