
import Core

public struct Size: Primitive, Geometry {

	public var storage: Scalar2D

	@inlinable public var width: Scalar {
		get { storage.0 }
		set { storage.0 = newValue }
	}

	@inlinable public var height: Scalar {
		get { storage.1 }
		set { storage.1 = newValue }
	}

	@inlinable public init(_ storage: Storage) {
		self.storage = storage
	}

	@inlinable public init(width: Scalar = .zero, height: Scalar = .zero) {
		self.storage = (width, height)
	}
}

// MARK: -

extension Size {

	
}

// MARK: -

extension Size: Codable {

	public init(from decoder: any Decoder) throws {
		var container = try decoder.unkeyedContainer()
		let width = try container.decode(Scalar.self)
		let height = try container.decode(Scalar.self)
		self.init(width: width, height: height)
	}

	public func encode(to encoder: any Encoder) throws {
		var container = encoder.unkeyedContainer()
		try container.encode(width)
		try container.encode(height)
	}
}

// MARK: -

extension Size: CustomDebugStringConvertible {
	public var debugDescription: String {
		"(\(width), \(height))"
	}
}

// MARK: -

extension Size: ExpressibleByFloatLiteral {
	@inlinable public init(floatLiteral value: FloatLiteralType) {
		self.init((.init(value), .init(value)))
	}
}

// MARK: -

extension Size: ExpressibleByIntegerLiteral {
	@inlinable public init(integerLiteral value: IntegerLiteralType) {
		self.init((.init(value), .init(value)))
	}
}

//// MARK: -
//
//extension Size {
//
//	@inlinable public static var zero: Size {
//		.all(.zero)
//	}
//
//	@inlinable public var isEmpty: Bool {
//		width.isZero || height.isZero
//	}
//
//	@inlinable public var isZero: Bool {
//		width.isZero && height.isZero
//	}
//}
//
//// MARK: -
//
//extension Size {
//
//	@inlinable public static prefix func - (value: Self) -> Self {
//		.init(width: -value.width, height: -value.height)
//	}
//
//	@inlinable public static func + (lhs: Self, rhs: Self) -> Self {
//		.init(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
//	}
//
//	@inlinable public static func - (lhs: Self, rhs: Self) -> Self {
//		.init(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
//	}
//
//	@inlinable public static func * (lhs: Self, rhs: Self) -> Self {
//		.init(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
//	}
//
//	@inlinable public static func / (lhs: Self, rhs: Self) -> Self {
//		.init(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
//	}
//
//	@inlinable public static func == (lhs: Self, rhs: Self) -> Bool {
//		lhs.width == rhs.width && lhs.height == rhs.height
//	}
//
//	@inlinable public static func all(_ value: Scalar) -> Self {
//		.init(width: value, height: value)
//	}
//
//	@inlinable public static func width(_ value: Scalar) -> Self {
//		.init(width: value)
//	}
//
//	@inlinable public static func height(_ value: Scalar) -> Self {
//		.init(height: value)
//	}
//
//
//	public func hash(into hasher: inout Hasher) {
//		hasher.combine(width)
//		hasher.combine(height)
//	}
//
//	@inlinable public func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Self {
//		.init(width: width.rounded(rule), height: height.rounded(rule))
//	}
//
//	@inlinable public mutating func round(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) {
//		width.round(rule)
//		height.round(rule)
//	}
//
////	public func applying(_ transform: Transform) -> Self {
////		let w = transform.a * width + transform.c * height
////		let h = transform.b * width + transform.d * height
////		return .init(width: w, height: h)
////	}
//
////	@inlinable public func inseted(by space: Space) -> Self {
////		.init(storage - space.storage.highHalf - space.storage.lowHalf)
////	}
//
//	@inlinable public mutating func negate() {
//		width.negate()
//		height.negate()
//	}
//}
//
//// MARK: -
//
//extension Size {
//
//	@inlinable public static func *= (lhs: inout Self, rhs: Self) {
//		lhs = lhs * rhs
//	}
//
//	@inlinable public static func /= (lhs: inout Self, rhs: Self) {
//		lhs = lhs / rhs
//	}
//}
