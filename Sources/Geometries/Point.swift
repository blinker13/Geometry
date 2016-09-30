
import Core

public struct Point: Primitive, Geometry {

	public var storage: Scalar2D

	@inlinable public var x: Scalar {
		get { storage.0 }
		set { storage.0 = newValue }
	}

	@inlinable public var y: Scalar {
		get { storage.1 }
		set { storage.1 = newValue }
	}

	@inlinable public init(_ storage: Storage) {
		self.storage = storage
	}

	@inlinable public init(x: Scalar = .zero, y: Scalar = .zero) {
		self.storage = (x, y)
	}
}

// MARK: -

extension Point {

	@inlinable public static var zero: Self {
		.both(.zero)
	}

	@inlinable public static var infinity: Self {
		.both(.infinity)
	}

	@inlinable public static func both(_ value: Scalar) -> Self {
		.init(x: value, y: value)
	}

	@inlinable public static func x(_ value: Scalar) -> Self {
		.init(x: value)
	}

	@inlinable public static func y(_ value: Scalar) -> Self {
		.init(y: value)
	}

	@inlinable public var isFinite: Bool {
		x.isFinite && y.isFinite
	}

	@inlinable public var isInfinite: Bool {
		x.isInfinite || y.isInfinite
	}

	@inlinable public var isZero: Bool {
		x.isZero && y.isZero
	}

	public init(from decoder: any Decoder) throws {
		var container = try decoder.unkeyedContainer()
		let x = try container.decode(Scalar.self)
		let y = try container.decode(Scalar.self)
		self.init(x: x, y: y)
	}

	public func encode(to encoder: any Encoder) throws {
		var container = encoder.unkeyedContainer()
		try container.encode(x)
		try container.encode(y)
	}

	public func hash(into hasher: inout Hasher) {
		hasher.combine(x)
		hasher.combine(y)
	}
}

// MARK: -

//extension Point: Transformable {
//
//	@inlinable func applying(_ transform: Transform) -> Self {
//		let newX = transform.a * x + transform.c * y + transform.x
//		let newY = transform.b * x + transform.d * y + transform.y
//		return .init(x: newX, y: newY)
//	}
//}

// MARK: -

extension Point: CustomDebugStringConvertible {
	public var debugDescription: String {
		"(\(x), \(y))"
	}
}

// MARK: -

extension Point: ExpressibleByFloatLiteral {
	@inlinable public init(floatLiteral value: FloatLiteralType) {
		self.init((.init(value), .init(value)))
	}
}

// MARK: -

extension Point: ExpressibleByIntegerLiteral {
	@inlinable public init(integerLiteral value: IntegerLiteralType) {
		self.init((.init(value), .init(value)))
	}
}
