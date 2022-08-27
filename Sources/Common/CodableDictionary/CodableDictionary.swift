/* *************************************************************************************************
CodableDictionary.swift
  © 2020 YOCKOW.
    Licensed under MIT License.
    See "LICENSE.txt" for more information.
 ************************************************************************************************ */

/// A wrapper for a dictionary to be en/decoded as expected.
/// Videlicet, this is yet another workaround for [SR-7788](https://bugs.swift.org/browse/SR-7788).
public struct CodableDictionary<Key, Value> where Key: CodableDictionaryKey, Value: Codable {
  /// Wrapped dictionary.
  public var dictionary: [Key: Value]

  private init(_dictionary: [Key: Value]) {
    self.dictionary = _dictionary
  }

  /// Creates an empty dictionary.
  public init() {
    self.init(_dictionary: [:])
  }

  /// Creates an empty dictionary with preallocated space
  /// for at least the specified number of elements.
  public init(minimumCapacity: Int) {
    self.init(_dictionary: .init(minimumCapacity: minimumCapacity))
  }

  /// Creates a new dictionary from the key-value pairs in the given sequence.
  public init<S>(uniqueKeysWithValues keysAndValues: S) where S: Sequence, S.Element == (Key, Value) {
    if case let dictionary as Dictionary<Key, Value> = keysAndValues {
      self.init(_dictionary: dictionary)
    } else {
      self.init()
      for (key, value) in keysAndValues {
        self.dictionary[key] = value
      }
    }
  }

  /// Creates a new dictionary from the key-value pairs in the given sequence,
  /// using a combining closure to determine the value for any duplicate keys.
  public init<S>(_ keysAndValues: S,
                 uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows where S: Sequence, S.Element == (Key, Value) {
    self.init(_dictionary: try Dictionary(keysAndValues, uniquingKeysWith: combine))
  }

  /// Creates a new dictionary whose keys are the groupings returned by the given closure
  /// and whose values are arrays of the elements that returned each key.
  public init<S>(grouping values: S,
                 by keyForValue: (S.Element) throws -> Key) rethrows where Value == [S.Element], S: Sequence {
    self.init(_dictionary: try Dictionary(grouping: values, by: keyForValue))
  }

  public var isEmpty: Bool {
    return self.dictionary.isEmpty
  }

  public var count: Int {
    return self.dictionary.count
  }

  public var underestimatedCount: Int {
    return self.dictionary.underestimatedCount
  }

  public var capacity: Int {
    return self.dictionary.capacity
  }

  public subscript(key: Key) -> Value? {
    get {
      return self.dictionary[key]
    }
    set {
      self.dictionary[key] = newValue
    }
  }

  public subscript(key: Key, default defaultValue: @autoclosure () -> Value) -> Value {
    get {
      return self.dictionary[key, default: defaultValue()]
    }
    set {
      self.dictionary[key, default: defaultValue()] = newValue
    }
  }
}

extension CodableDictionary: Encodable {
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: Key.self)
    for (key, value) in self.dictionary {
      try container.encode(value, forKey: key)
    }
  }
}

extension CodableDictionary: Decodable {
  public init(from decoder: Decoder) throws {
    self.init()

    let container = try decoder.container(keyedBy: Key.self)
    for key in container.allKeys {
      self[key] = try container.decode(Value.self, forKey: key)
    }
  }
}

extension CodableDictionary: ExpressibleByDictionaryLiteral {
  public init(dictionaryLiteral elements: (Key, Value)...) {
    self.init()
    for (key, value) in elements {
      self.dictionary[key] = value
    }
  }
}

extension CodableDictionary: Sequence {
  public typealias Element =  Dictionary<Key, Value>.Element

  public typealias Iterator = DictionaryIterator<Key, Value>

  public func makeIterator() -> Iterator {
    return self.dictionary.makeIterator()
  }
}

extension CodableDictionary: Collection {
  public typealias Index = DictionaryIndex<Key, Value>

  public var startIndex: Index {
    return self.dictionary.startIndex
  }

  public var endIndex: Index {
    return self.dictionary.endIndex
  }

  public subscript(position: Index) -> (key: Key, value: Value) {
    return self.dictionary[position]
  }

  public func index(after i: Index) -> Index {
    return self.dictionary.index(after: i)
  }
}

extension CodableDictionary: CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable {
  public var description: String {
    return self.dictionary.description
  }

  public var debugDescription: String {
    return self.dictionary.debugDescription
  }

  public var customMirror: Mirror {
    return self.dictionary.customMirror
  }
}

extension CodableDictionary: Equatable where Value: Equatable {}

extension CodableDictionary: Hashable where Value: Hashable {}


// MARK: - Other Methods
extension CodableDictionary {
  public typealias Keys = Dictionary<Key, Value>.Keys
  public typealias Values = Dictionary<Key, Value>.Values

  public func index(forKey key: Key) -> Index? {
    return self.dictionary.index(forKey: key)
  }

  public var keys: Keys {
    return self.dictionary.keys
  }

  public var values: Values {
    return self.dictionary.values
  }

  public var first: Element? {
    return self.dictionary.first
  }

  /// Returns a random element of the collection.
  public func randomElement() -> (key: Key, value: Value)? {
    return self.dictionary.randomElement()
  }

  /// Returns a random element of the collection, using the given generator as a source for randomness.
  public func randomElement<T>(using generator: inout T) -> (key: Key, value: Value)? where T: RandomNumberGenerator {
    return self.dictionary.randomElement(using: &generator)
  }

  /// Updates the value stored in the dictionary for the given key,
  /// or adds a new key-value pair if the key does not exist.
  @discardableResult
  public mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
    return self.dictionary.updateValue(value, forKey: key)
  }


  /// Merges the key-value pairs in the given sequence into the dictionary,
  /// using a combining closure to determine the value for any duplicate keys.
  public mutating func merge<S>(_ other: S,
                                uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows where S: Sequence, S.Element == (Key, Value) {
    try self.dictionary.merge(other, uniquingKeysWith: combine)
  }

  /// Creates a codable dictionary by merging key-value pairs in a sequence into the dictionary,
  /// using a combining closure to determine the value for duplicate keys.
  public func merging<S>(_ other: S,
                         uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> CodableDictionary<Key, Value> where S: Sequence, S.Element == (Key, Value) {
    return CodableDictionary(_dictionary: try self.dictionary.merging(other, uniquingKeysWith: combine))
  }

  public mutating func reserveCapacity(_ minimumCapacity: Int) {
    self.dictionary.reserveCapacity(minimumCapacity)
  }

  @discardableResult
  public mutating func removeValue(forKey key: Key) -> Value? {
    return self.dictionary.removeValue(forKey: key)
  }

  @discardableResult
  public mutating func remove(at index: Index) -> Element {
    return self.dictionary.remove(at: index)
  }

  public mutating func removeAll(keepingCapacity keepCapacity: Bool = false) {
    self.dictionary.removeAll(keepingCapacity: keepCapacity)
  }

  /// Returns a new codable dictionary containing the keys of this dictionary
  /// with the values transformed by the given closure.
  public func mapValues<T>(_ transform: (Value) throws -> T) rethrows -> CodableDictionary<Key, T> {
    return CodableDictionary<Key, T>(_dictionary: try self.dictionary.mapValues(transform))
  }
}
