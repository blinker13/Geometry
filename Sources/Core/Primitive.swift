
public protocol Primitive: Codable, Hashable, Sendable {
	associatedtype Storage: Sendable
	var storage: Storage { get set }
	init(_ storage: Storage)
}

// MARK: -

extension Primitive where Storage : FloatingPoint {
	
	@inlinable public static var infinity: Self {
		.init(Storage.infinity)
	}

	@inlinable public static var tolerance: Self {
		.init(Storage.ulpOfOne.squareRoot())
	}

	@inlinable public static func + (lhs: Self, rhs: Self) -> Self {
		.init(lhs.storage + rhs.storage)
	}
	
	@inlinable public static func - (lhs: Self, rhs: Self) -> Self {
		.init(lhs.storage - rhs.storage)
	}

	@inlinable public static func * (lhs: Self, rhs: Self) -> Self {
		.init(lhs.storage * rhs.storage)
	}

	@inlinable public static func / (lhs: Self, rhs: Self) -> Self {
		.init(lhs.storage / rhs.storage)
	}

	@inlinable public static func *= (lhs: inout Self, rhs: Self) {
		lhs.storage *= rhs.storage
	}

	@inlinable public static func /= (lhs: inout Self, rhs: Self) {
		lhs.storage /= rhs.storage
	}

	@inlinable public var isFinite: Bool {
		storage.isFinite
	}

	@inlinable public var isInfinite: Bool {
		storage.isInfinite
	}

	@inlinable public var isZero: Bool {
		storage.isZero
	}

	@inlinable public mutating func round(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) {
		storage.round(rule)
	}

	@inlinable public func distance(to other: Self) -> Self {
		.init(other.storage - storage)
	}

	@inlinable public func advanced(by n: Self) -> Self {
		.init(storage + n.storage)
	}
}

// MARK: -

extension Primitive where Storage == Scalar {
	
	@inlinable public static prefix func - (value: Self) -> Self {
		.init(-value.storage)
	}

	@inlinable public static func += (lhs: inout Self, rhs: Self) {
		lhs.storage += rhs.storage
	}
	
	@inlinable public static func -= (lhs: inout Self, rhs: Self) {
		lhs.storage -= rhs.storage
	}

	@inlinable public static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.storage == rhs.storage
	}

	@inlinable public func hash(into hasher: inout Hasher) {
		hasher.combine(storage)
	}

	@inlinable public func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Self {
		let value = storage.rounded(rule)
		return .init(value)
	}

	@inlinable public mutating func negate() {
		storage.negate()
	}
}

// MARK: -

extension Primitive where Storage == Scalar2D {
	
	@inlinable public static prefix func - (value: Self) -> Self {
		.init((-value.storage.0, -value.storage.1))
	}

	@inlinable public static func += (lhs: inout Self, rhs: Self) {
		lhs.storage.0 += rhs.storage.0
		lhs.storage.1 += rhs.storage.1
	}

	@inlinable public static func -= (lhs: inout Self, rhs: Self) {
		lhs.storage.0 -= rhs.storage.0
		lhs.storage.1 -= rhs.storage.1
	}

	@inlinable public static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.storage.0 == rhs.storage.0 &&
		lhs.storage.1 == rhs.storage.1
	}

	@inlinable public func hash(into hasher: inout Hasher) {
		hasher.combine(storage.0)
		hasher.combine(storage.1)
	}

	@inlinable public func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Self {
		let value0 = storage.0.rounded(rule)
		let value1 = storage.1.rounded(rule)
		return .init((value0, value1))
	}

	@inlinable public mutating func negate() {
		storage.0.negate()
		storage.1.negate()
	}
}
