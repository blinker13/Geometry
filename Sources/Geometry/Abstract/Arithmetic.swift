
public protocol Arithmetic: AdditiveArithmetic {

	static prefix func - (value: Self) -> Self

	func rounded(_ rule: FloatingPointRoundingRule) -> Self
	mutating func round(_ rule: FloatingPointRoundingRule)

	mutating func negate()
}

// MARK: -

extension Arithmetic where Self: Primitive {

	@inlinable public mutating func round(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) {
		self = rounded(rule)
	}

	@inlinable public mutating func negate() {
		self = -self
	}
}

// MARK: -

extension Collection where Element: Arithmetic {

	@inlinable public static func + (lhs: Self, rhs: Element) -> [Element] {
		lhs.map { $0 + rhs }
	}

	@inlinable public static func - (lhs: Self, rhs: Element) -> [Element] {
		lhs.map { $0 - rhs }
	}

	@inlinable public func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> [Element] {
		map { $0.rounded(rule) }
	}

	@inlinable public func negated() -> [Element] {
		map { -$0 }
	}
}
