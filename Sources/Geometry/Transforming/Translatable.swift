
public protocol Translatable {

	func translated(x: Scalar, y: Scalar) -> Self
	mutating func translate(x: Scalar, y: Scalar)

	func translated(by value: Scalar) -> Self
	mutating func translate(by value: Scalar)

	func translated(by point: Point) -> Self
	mutating func translate(by point: Point)
}

// MARK: -

extension Translatable {

	@inlinable public mutating func translate(x: Scalar, y: Scalar) {
		self = self.translated(x: x, y: y)
	}

	@inlinable public func translated(by value: Scalar) -> Self {
		translated(x: value, y: value)
	}

	@inlinable public mutating func translate(by value: Scalar) {
		self = self.translated(by: value)
	}

	@inlinable public func translated(by point: Point) -> Self {
		translated(x: point.x, y: point.y)
	}

	@inlinable public mutating func translate(by point: Point) {
		self = self.translated(by: point)
	}

}
