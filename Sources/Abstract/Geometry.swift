
public protocol Geometry : Arithmetic, SIMDRepresentable {
	func addingProduct(_ left: Self, _ right: Self) -> Self
	func applying(_ transform: Transform) -> Self
	func squareRoot() -> Self
}

// MARK: -

public extension Geometry {

	@inlinable func addingProduct(_ left: Self, _ right: Self) -> Self {
		.init(storage.addingProduct(left.storage, right.storage))
	}

	@inlinable func squareRoot() -> Self {
		.init(storage.squareRoot())
	}
}

// MARK: -

public extension Geometry {

	@inlinable func rotated(by angle: Angle) -> Self {
		let transform = Transform(rotate: angle)
		return applying(transform)
	}

	@inlinable func scaled(by size: Size) -> Self {
		let transform = Transform(scale: size)
		return applying(transform)
	}

	@inlinable func translated(by point: Point) -> Self {
		let transform = Transform(translate: point)
		return applying(transform)
	}
}

// MARK: -

public extension Array where Element : Geometry {

	@inlinable func addingProduct(_ left: Element, _ right: Element) -> Self {
		map { $0.addingProduct(left, right) }
	}

	@inlinable func applying(_ transform: Transform) -> Self {
		map { $0.applying(transform) }
	}

	@inlinable func squareRoot() -> Self {
		map { $0.squareRoot() }
	}
}
