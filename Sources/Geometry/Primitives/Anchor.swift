
public struct Anchor: Primitive {

	public var storage: Storage<Scalar, Scalar>

	@inlinable public var horizontal: Scalar {
		get { storage.value.0 }
		set { storage.value.0 = newValue }
	}

	@inlinable public var vertical: Scalar {
		get { storage.value.1 }
		set { storage.value.1 = newValue }
	}

	@inlinable public init(_ storage: Storage<Scalar, Scalar>) {
		self.storage = storage
	}

	@inlinable public init(horizontal: Scalar = .zero, vertical: Scalar = .zero) {
		self.storage = .init(horizontal, vertical)
	}

	@inlinable public init(same value: Scalar) {
		self.storage = .init(value, value)
	}
}

// MARK: -

extension Anchor: Arithmetic {

	@inlinable public static var topLeading: Self {
		.init(horizontal: 0.0, vertical: 0.0)
	}

	@inlinable public static var top: Self {
		.init(horizontal: 0.5, vertical: 0.0)
	}

	@inlinable public static var topTrailing: Self {
		.init(horizontal: 1.0, vertical: 0.0)
	}

	@inlinable public static var leading: Self {
		.init(horizontal: 0.0, vertical: 0.5)
	}

	@inlinable public static var center: Self {
		.init(horizontal: 0.5, vertical: 0.5)
	}

	@inlinable public static var trailing: Self {
		.init(horizontal: 1.0, vertical: 0.5)
	}

	@inlinable public static var bottomLeading: Self {
		.init(horizontal: 0.0, vertical: 1.0)
	}

	@inlinable public static var bottom: Self {
		.init(horizontal: 0.5, vertical: 1.0)
	}

	@inlinable public static var bottomTrailing: Self {
		.init(horizontal: 1.0, vertical: 1.0)
	}
}

// MARK: -

extension Anchor: CustomDebugStringConvertible {

	public var debugDescription: String {
		"(\(horizontal), \(vertical))"
	}
}

// MARK: -

extension Anchor: ExpressibleByFloatLiteral {

	@inlinable public init(floatLiteral value: Scalar.Native) {
		self.init(same: .init(value))
	}
}

// MARK: -

extension Anchor: ExpressibleByIntegerLiteral {

	@inlinable public init(integerLiteral value: Scalar.Native) {
		self.init(same: .init(value))
	}
}
