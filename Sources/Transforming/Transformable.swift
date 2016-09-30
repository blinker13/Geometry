
public protocol Transformable {

	func applying(_ transform: Transform) -> Self

	func rotated(by angle: Angle) -> Self
	func scaled(by size: Size) -> Self
	func translated(by point: Point) -> Self
}

// MARK: -

public extension Transformable {

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

extension Array : Transformable where Element : Transformable {
	public func applying(_ transform: Transform) -> Self {
		map { $0.applying(transform) }
	}
}
