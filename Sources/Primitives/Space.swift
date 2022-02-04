
public struct Space : Arithmetic, Codable, SIMDRepresentable {
	public var storage: SIMD4<Scalar>
}

// MARK: -

public extension Space {

	@inlinable var top: Scalar {
		get { storage.y }
		set { storage.y = newValue }
	}

	@inlinable var left: Scalar {
		get { storage.x }
		set { storage.x = newValue }
	}

	@inlinable var bottom: Scalar {
		get { storage.w }
		set { storage.w = newValue }
	}

	@inlinable var right: Scalar {
		get { storage.z }
		set { storage.z = newValue }
	}

	@inlinable init(_ value: SIMD4<Scalar>) {
		storage = value
	}

	@inlinable init(top: Scalar = .zero, left: Scalar = .zero, bottom: Scalar = .zero, right: Scalar = .zero) {
		storage = .init(left, top, right, bottom)
	}

	@inlinable init(horizontal: Scalar = .zero, vertical: Scalar = .zero) {
		storage = .init(horizontal, vertical, horizontal, vertical)
	}

	@inlinable init(all value: Scalar) {
		storage = .init(repeating: value)
	}
}
