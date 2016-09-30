
import Core

public struct Angle: Primitive, Geometry {

	public var storage: Scalar

	@inlinable public init(_ storage: Scalar) {
		self.storage = storage
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		storage = try container.decode(Scalar.self)
	}

	public func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(storage)
	}
}

// MARK: -

extension Angle {

	@inlinable public static var half: Self {
		.radians(.pi)
	}
	
	@inlinable public static var full: Self {
		.radians(.pi * 2)
	}

	@inlinable public static func degrees(_ value: Scalar) -> Self {
		.init(value / 180.0 * .pi)
	}
	
	@inlinable public static func radians(_ value: Scalar) -> Self {
		.init(value)
	}

	@inlinable public var degrees: Scalar {
		radians * 180.0 / .pi
	}

	@inlinable public var radians: Scalar {
		storage
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
	@inlinable public init(floatLiteral value: FloatLiteralType) {
		storage = .init(value)
	}
}

// MARK: -

extension Angle: ExpressibleByIntegerLiteral {
	@inlinable public init(integerLiteral value: IntegerLiteralType) {
		storage = .init(value) / 180.0 * .pi
	}
}
