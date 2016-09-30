
public struct Storage<each Value: Sendable>: Sendable {

	@usableFromInline package var value: (repeat each Value)

	@usableFromInline package init(_ value: repeat each Value) {
		self.value = (repeat each value)
	}
}

// MARK: -

extension Storage: AdditiveArithmetic where repeat each Value: AdditiveArithmetic {

	@inlinable public static var zero: Self {
		.init(repeat (each Value).zero)
	}

	@inlinable public static func + (lhs: Self, rhs: Self) -> Self {
		.init(repeat (each lhs.value + each rhs.value))
	}

	@inlinable public static func - (lhs: Self, rhs: Self) -> Self {
		.init(repeat (each lhs.value - each rhs.value))
	}
}

// MARK: -

extension Storage: Arithmetic where repeat each Value: Arithmetic {

	@inlinable public static prefix func - (storage: Self) -> Self {
		.init(repeat -(each storage.value))
	}

	@inlinable public func rounded(_ rule: FloatingPointRoundingRule) -> Self {
		.init(repeat (each self.value).rounded(rule))
	}

	public mutating func round(_ rule: FloatingPointRoundingRule) {
		self = rounded(rule)
	}

	public mutating func negate() {
		self = -self
	}
}

// MARK: -

extension Storage: Codable where repeat each Value: Codable {

	@inlinable public init(from decoder: any Decoder) throws {
		var container = try decoder.unkeyedContainer()
		self.init(repeat try container.decode((each Value).self))
	}

	@inlinable public func encode(to encoder: any Encoder) throws {
		var container = encoder.unkeyedContainer()
		repeat try container.encode(each value)
	}
}

// MARK: -

extension Storage: Equatable where repeat each Value: Equatable {

	@inlinable public static func == (lhs: Self, rhs: Self) -> Bool {
		for (l, r) in repeat (each lhs.value, each rhs.value) {
			guard l == r else { return false }
		}
		return true
	}
}

// MARK: -

extension Storage: Hashable where repeat each Value: Hashable {

	@inlinable public func hash(into hasher: inout Hasher) {
		repeat hasher.combine(each value)
	}
}
