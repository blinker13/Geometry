
public struct Angle : Arithmetic, Codable, Comparable {

	@usableFromInline internal let rawValue: Scalar

	@usableFromInline internal init(_ value: Scalar) {
		rawValue = value
	}
}

// MARK: -

public extension Angle {

	@inlinable static var zero: Self { .radians(.zero) }
	@inlinable static var half: Self { .radians(.pi) }
	@inlinable static var full: Self { .radians(.pi * 2) }

	@inlinable static prefix func - (value: Self) -> Self { .init(value.rawValue) }

	@inlinable static func + (left: Self, right: Self) -> Self { .init(left.rawValue + right.rawValue) }
	@inlinable static func - (left: Self, right: Self) -> Self { .init(left.rawValue - right.rawValue) }
	@inlinable static func * (left: Self, right: Self) -> Self { .init(left.rawValue * right.rawValue) }
	@inlinable static func / (left: Self, right: Self) -> Self { .init(left.rawValue / right.rawValue) }

	@inlinable static func < (left: Self, right: Self) -> Bool { left.rawValue < right.rawValue }

	@inlinable static func degrees(_ value: Scalar) -> Self { .init(degrees: value) }
	@inlinable static func radians(_ value: Scalar) -> Self { .init(radians: value) }

	@inlinable var degrees: Scalar { rawValue * 180.0 / .pi }
	@inlinable var radians: Scalar { rawValue }

	@inlinable init(degrees: Scalar) { rawValue = degrees / 180.0 * .pi }
	@inlinable init(radians: Scalar) { rawValue = radians }

	@inlinable init(from decoder: Decoder) throws {
		rawValue = try Scalar(from: decoder)
	}

	@inlinable func encode(to encoder: Encoder) throws {
		try rawValue.encode(to: encoder)
	}

	@inlinable func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Self {
		.init(rawValue.rounded(rule))
	}
}
