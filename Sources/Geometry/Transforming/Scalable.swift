
public protocol Scalable {

	func scaled(x: Scalar, y: Scalar) -> Self
	mutating func scale(x: Scalar, y: Scalar)

	func scaled(by value: Scalar) -> Self
	mutating func scaled(by value: Scalar)

	func scaled(by size: Size) -> Self
	mutating func scaled(by size: Size)
}

// MARK: -

extension Scalable {

	@inlinable public mutating func scale(x: Scalar, y: Scalar) {
		self = scaled(x: x, y: y)
	}

	@inlinable public func scaled(by value: Scalar) -> Self {
		scaled(x: value, y: value)
	}

	@inlinable public mutating func scaled(by value: Scalar) {
		self = scaled(by: value)
	}

	@inlinable public func scaled(by size: Size) -> Self {
		scaled(x: size.width, y: size.height)
	}

	@inlinable public mutating func scaled(by size: Size) {
		self = scaled(by: size)
	}
}
