//
//public struct Polygon: Equatable, ExpressibleByArrayLiteral {
//	public let points: [Point]
//}
//
//// MARK: -
//
//public extension Polygon {
//
//	@inlinable var path: Path {
//		let lines = points.dropFirst()
//		let moveTo = points.first.map(Path.Element.move)!
//		let lineTo = lines.map(Path.Element.line)
//		let elements = [ moveTo ] + lineTo + [ .close ]
//		return .init(with: elements)
//	}
//
//	@inlinable init(with points: [Point]) {
//		self.points = points
//	}
//
//	@inlinable init(arrayLiteral elements: Point ...) {
//		self.points = elements
//	}
//
////	@inlinable func applying(_ transform: Transform) -> Self {
////		let newPoints = points.applying(transform)
////		return .init(with: newPoints)
////	}
//}
