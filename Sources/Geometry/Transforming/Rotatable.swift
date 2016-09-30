
public protocol Rotatable {
	func rotated(by angle: Angle) -> Self
	mutating func rotate(by angle: Angle)
}

// MARK: -

extension Rotatable {

	@inlinable public mutating func rotate(by angle: Angle) {
		self = self.rotated(by: angle)
	}
}
