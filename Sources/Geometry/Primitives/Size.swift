
public struct Size: Arithmetic, Primitive {

	public var storage: Storage<Scalar, Scalar>

	@inlinable public var width: Scalar {
		get { storage.value.0 }
		set { storage.value.0 = newValue }
	}

	@inlinable public var height: Scalar {
		get { storage.value.1 }
		set { storage.value.1 = newValue }
	}

	@inlinable public init(_ storage: Storage<Scalar, Scalar>) {
		self.storage = storage
	}

	@inlinable public init(width: Scalar = .zero, height: Scalar = .zero) {
		self.storage = .init(width, height)
	}

	@inlinable public init(same value: Scalar) {
		self.storage = .init(value, value)
	}
}

// MARK: -

extension Size {

	@inlinable public var isEmpty: Bool {
		width.isZero || height.isZero
	}

	@inlinable public var isZero: Bool {
		width.isZero && height.isZero
	}
}

// MARK: -

extension Size: Comparable {

	@inlinable public static func < (lhs: Self, rhs: Self) -> Bool {
		lhs.width * lhs.height < rhs.width * rhs.height
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

	@inlinable public init(floatLiteral value: Scalar.Native) {
		self.init(same: .init(value))
	}
}

// MARK: -

extension Size: ExpressibleByIntegerLiteral {

	@inlinable public init(integerLiteral value: Scalar.Native) {
		self.init(same: .init(value))
	}
}
