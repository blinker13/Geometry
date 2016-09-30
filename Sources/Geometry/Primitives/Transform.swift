
public struct Transform: Primitive {

	public var storage: Storage<Scalar, Scalar, Scalar, Scalar, Scalar, Scalar>

	@inlinable public init(_ storage: Storage<Scalar, Scalar, Scalar, Scalar, Scalar, Scalar>) {
		self.storage = storage
	}

	@inlinable public init(scale: Size, rotation: Angle = .zero, translation: Point = .zero) {
		self.storage = .init(1, 0, 0, 1, translation.x, translation.y)
	}

//	public let a: Scalar
//	public let b: Scalar
//	public let c: Scalar
//	public let d: Scalar
//	public let x: Scalar
//	public let y: Scalar
}

// MARK: -

public extension Transform {

	@inlinable static var identity: Self {
		.init(.init(1, 0, 0, 1, 0, 0))
	}

//	@inlinable static func rotation(by angle: Angle) -> Self { .init(rotate: angle) }
//	@inlinable static func rotation(degrees value: Scalar) -> Self { .init(degrees: value) }
//	@inlinable static func rotation(radians value: Scalar) -> Self { .init(radians: value) }
//
//	@inlinable static func scaling(by size: Size) -> Self { .init(scale: size) }
//	@inlinable static func scaling(width: Scalar, height: Scalar) -> Self { .init(width: width, height: height) }
//
//	@inlinable static func translation(by point: Point) -> Self { .init(translate: point) }
//
//	@inlinable init(_ a: Scalar, _ b: Scalar, _ c: Scalar, _ d: Scalar, _ x: Scalar, _ y: Scalar) {
//		(self.a, self.b, self.c, self.d, self.x, self.y) = (a, b, c, d, x, y)
//	}
//
//	@inlinable init(rotate angle: Angle) {
//		let sine = sin(angle.radians), cosine = cos(angle.radians)
//		self.init(cosine, sine, -sine, cosine, 0, 0)
//	}
//
//	@inlinable init(degrees value: Scalar) {
//		let angle = Angle(degrees: value)
//		self.init(rotate: angle)
//	}
//
//	@inlinable init(radians value: Scalar) {
//		let angle = Angle(radians: value)
//		self.init(rotate: angle)
//	}
//
//	@inlinable init(scale size: Size) {
//		self.init(size.width, 0, 0, size.height, 0, 0)
//	}
//
//	@inlinable init(width: Scalar, height: Scalar) {
//		self.init(width, 0, 0, height, 0, 0)
//	}
//
//	@inlinable init(translate point: Point) {
//		self.init(1, 0, 0, 1, point.x, point.y)
//	}
//
//	@inlinable func applying(_ transform: Self) -> Self {
//		let newA = transform.a * a + transform.b * c
//		let newB = transform.a * b + transform.b * d
//		let newC = transform.c * a + transform.d * c
//		let newD = transform.c * b + transform.d * d
//		let newX = transform.x * a + transform.y * c + x
//		let newY = transform.x * b + transform.y * d + y
//		return .init(newA, newB, newC, newD, newX, newY)
//	}
//
//	@inlinable func inverted() -> Self {
//		let determinant = 1 / (a * d - b * c)
//		let newA = determinant * d
//		let newB = determinant * -b
//		let newC = determinant * -c
//		let newD = determinant * a
//		let newX = determinant * (c * y - d * x)
//		let newY = determinant * (b * x - a * y)
//		return .init(newA, newB, newC, newD, newX, newY)
//	}
}

// MARK: -

extension Transform: Rotatable {

	public func rotated(by angle: Angle) -> Self {
		let sina = sin(angle)
		let cosa = cos(angle)
		return .init(.init(cosa, sina, -sina, -cosa, 0, 0))
	}
}

// MARK: -

extension Transform: Scalable {

	public func scaled(x: Scalar, y: Scalar) -> Self {
		.identity
	}
}

// MARK: -

extension Transform: Translatable {

	public func translated(x: Scalar, y: Scalar) -> Self {
		.identity
	}
}
