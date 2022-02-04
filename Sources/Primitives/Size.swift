
public struct Size : Codable, Geometry {
	public var storage: SIMD2<Scalar>
}

// MARK: -

public extension Size {

	@inlinable var width: Scalar {
		get { storage.x }
		set { storage.x = newValue }
	}

	@inlinable var height: Scalar {
		get { storage.y }
		set { storage.y = newValue }
	}

	@inlinable var isEmpty: Bool { width == .zero || height == .zero }

	@inlinable init(_ value: SIMD2<Scalar>) {
		storage = value
	}

	@inlinable init(width: Scalar, height: Scalar) {
		storage = .init(width, height)
	}

	@inlinable init(sides: Scalar) {
		storage = .init(repeating: sides)
	}

	@inlinable func inseted(by space: Space) -> Self {
		.init(storage - space.storage.highHalf - space.storage.lowHalf)
	}

	@inlinable func applying(_ transform: Transform) -> Self {
		let w = transform.a * width + transform.c * height
		let h = transform.b * width + transform.d * height
		return .init(width: w, height: h)
	}
}
