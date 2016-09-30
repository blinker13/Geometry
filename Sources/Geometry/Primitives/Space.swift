
public struct Space: Arithmetic, Primitive {

	public var storage: Storage<Scalar, Scalar, Scalar, Scalar>

	@inlinable public var top: Scalar {
		get { storage.value.0 }
		set { storage.value.0 = newValue }
	}

	@inlinable public var left: Scalar {
		get { storage.value.1 }
		set { storage.value.1 = newValue }
	}

	@inlinable public var bottom: Scalar {
		get { storage.value.2 }
//		set { storage.value.2 = newValue }
	}

	@inlinable public var right: Scalar {
		get { storage.value.3 }
		set { storage.value.3 = newValue }
	}

	@inlinable public init(_ storage: Storage<Scalar, Scalar, Scalar, Scalar>) {
		self.storage = storage
	}

	@inlinable public init(top: Scalar = .zero, left: Scalar = .zero, bottom: Scalar = .zero, right: Scalar = .zero) {
		self.storage = .init(top, left, bottom, right)
	}

	@inlinable public init(horizontal: Scalar = .zero, vertical: Scalar = .zero) {
		self.storage = .init(vertical, horizontal, vertical, horizontal)
	}

	@inlinable public init(same value: Scalar) {
		self.storage = .init(value, value, value, value)
	}
}

// MARK: -

extension Space: CustomDebugStringConvertible {
	public var debugDescription: String {
		"(\(top), \(left), \(bottom), \(right))"
	}
}

// MARK: -

extension Space: ExpressibleByFloatLiteral {

	@inlinable public init(floatLiteral value: Scalar.Native) {
		self.init(same: .init(value))
	}
}

// MARK: -

extension Space: ExpressibleByIntegerLiteral {

	@inlinable public init(integerLiteral value: Scalar.Native) {
		self.init(same: .init(value))
	}
}
