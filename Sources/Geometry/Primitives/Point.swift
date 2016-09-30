
public struct Point: Arithmetic, Primitive {

	public var storage: Storage<Scalar, Scalar>

	@inlinable public var x: Scalar {
		get { storage.value.0 }
		set { storage.value.0 = newValue }
	}

	@inlinable public var y: Scalar {
		get { storage.value.1 }
		set { storage.value.1 = newValue }
	}

	@inlinable public init(_ storage: Storage<Scalar, Scalar>) {
		self.storage = storage
	}

	@inlinable public init(x: Scalar = .zero, y: Scalar = .zero) {
		self.storage = .init(x, y)
	}

	@inlinable public init(same value: Scalar) {
		self.storage = .init(value, value)
	}
}

// MARK: -

extension Point {

	@inlinable public var isFinite: Bool {
		x.isFinite && y.isFinite
	}

	@inlinable public var isInfinite: Bool {
		x.isInfinite || y.isInfinite
	}

	@inlinable public var isZero: Bool {
		x.isZero && y.isZero
	}

	@inlinable public var magnitude: Scalar {
		(x * x + y * y).squareRoot()
	}

	@inlinable public func distance(to other: Self) -> Scalar {
		(self - other).magnitude
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

extension Point: Comparable {

	@inlinable public static func < (lhs: Self, rhs: Self) -> Bool {
		lhs.distance(to: .zero) < rhs.distance(to: .zero)
	}
}

// MARK: -

extension Point: CustomDebugStringConvertible {

	public var debugDescription: String {
		"(\(x), \(y))"
	}
}

// MARK: -

extension Point: ExpressibleByFloatLiteral {

	@inlinable public init(floatLiteral value: Scalar.Native) {
		self.init(same: .init(value))
	}
}

// MARK: -

extension Point: ExpressibleByIntegerLiteral {

	@inlinable public init(integerLiteral value: Scalar.Native) {
		self.init(same: .init(value))
	}
}
