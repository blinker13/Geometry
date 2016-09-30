
public protocol Primitive: Codable, Hashable, Sendable {

	associatedtype Storage: Sendable
	var storage: Storage { get set }
	init(_ storage: Storage)

//	func applying(_ transform: Transform) -> Self
//	mutating func apply(_ transform: Transform)

//	func rounded(_ rule: FloatingPointRoundingRule) -> Self
//	mutating func round(_ rule: FloatingPointRoundingRule)

}

// MARK: -

//extension Primitive {
//
//	@inlinable public  mutating func apply(_ transform: Transform) {
//		self = applying(transform)
//	}
//
//	public mutating func round(_ rule: FloatingPointRoundingRule) {
//		self = rounded(rule)
//	}
//}

// MARK: -

extension Primitive where Storage: Codable {

	@inlinable public init(from decoder: any Decoder) throws {
		self.init(try .init(from: decoder))
	}

	@inlinable public func encode(to encoder: any Encoder) throws {
		try storage.encode(to: encoder)
	}
}

// MARK: -

extension Primitive where Storage: Equatable {

	@inlinable public static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.storage == rhs.storage
	}
}

// MARK: -

extension Primitive where Storage: Hashable {

	@inlinable public func hash(into hasher: inout Hasher) {
		storage.hash(into: &hasher)
	}
}

// MARK: -

extension Primitive where Self: AdditiveArithmetic, Storage: AdditiveArithmetic {

	@inlinable public static func + (lhs: Self, rhs: Self) -> Self {
		.init(lhs.storage + rhs.storage)
	}

	@inlinable public static func - (lhs: Self, rhs: Self) -> Self {
		.init(lhs.storage - rhs.storage)
	}
}

// MARK: -

extension Primitive where Self: Arithmetic, Storage: Arithmetic {

	@inlinable public static prefix func - (value: Self) -> Self {
		.init(-value.storage)
	}

	@inlinable public func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Self {
		.init(storage.rounded(rule))
	}
}
