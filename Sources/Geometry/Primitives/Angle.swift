
import Spatial

public struct Angle: AdditiveArithmetic, Primitive {

	public var storage: Storage<Scalar>

	@inlinable public init(_ storage: Storage<Scalar>) {
		self.storage = storage
	}
}

// MARK: -

extension Angle {

	@inlinable public static var zero: Self {
		.radians(.zero)
	}

	@inlinable public static var right: Self {
		.radians(.pi * 0.5)
	}

	@inlinable public static var half: Self {
		.radians(.pi)
	}

	@inlinable public static var full: Self {
		.radians(.pi * 2)
	}

	@inlinable public static func degrees(_ value: Scalar) -> Self {
		.init(.init(value * .pi / 180))
	}

	@inlinable public static func radians(_ value: Scalar) -> Self {
		.init(.init(value))
	}

	@inlinable public static func turns(_ value: Scalar) -> Self {
		.init(.init(value * 2 * .pi))
	}

	@inlinable public var degrees: Scalar {
		storage.value * 180 / .pi
	}

	@inlinable public var radians: Scalar {
		storage.value
	}

	@inlinable public var turns: Scalar {
		storage.value / (2 * .pi)
	}
}

// MARK: -

extension Angle: Comparable {

	@inlinable public static func < (lhs: Self, rhs: Self) -> Bool {
		lhs.radians < rhs.radians
	}
}

// MARK: -

extension Angle: CustomStringConvertible {

	@inlinable public var description: String {
		"\(degrees)°"
	}
}

// MARK: -

extension Angle: ExpressibleByFloatLiteral {

	@inlinable public init(floatLiteral value: Scalar.Native) {
		self = .radians(.init(value))
	}
}

// MARK: -

extension Angle: ExpressibleByIntegerLiteral {

	@inlinable public init(integerLiteral value: Scalar.Native) {
		self = .degrees(.init(value))
	}
}

// MARK: -

import RealModule

@inlinable public func cos(_ angle: Angle) -> Scalar {
	.init(Scalar.Native.cos(angle.storage.value.native))
}

@inlinable public func cosh(_ angle: Angle) -> Scalar {
	.init(Scalar.Native.cosh(angle.storage.value.native))
}

@inlinable public func sin(_ angle: Angle) -> Scalar {
	.init(Scalar.Native.sin(angle.storage.value.native))
}

@inlinable public func sinh(_ angle: Angle) -> Scalar {
	.init(Scalar.Native.sinh(angle.storage.value.native))
}

@inlinable public func tan(_ angle: Angle) -> Scalar {
	.init(Scalar.Native.tan(angle.storage.value.native))
}

@inlinable public func tanh(_ angle: Angle) -> Scalar {
	.init(Scalar.Native.tanh(angle.storage.value.native))
}


