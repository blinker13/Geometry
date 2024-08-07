//
//public struct Line : Equatable {
//	public let start: Point
//	public let end: Point
//}
//
//// MARK: -
//
//public extension Line {
//
//	@inlinable var minX: Scalar { min(start.x, end.x) }
//	@inlinable var minY: Scalar { min(start.y, end.y) }
//	@inlinable var midX: Scalar { (start.x + end.x) * 0.5 }
//	@inlinable var midY: Scalar { (start.y + end.y) * 0.5 }
//	@inlinable var maxX: Scalar { max(start.x, end.x) }
//	@inlinable var maxY: Scalar { max(start.y, end.y) }
//
//	@inlinable var center: Point { .init(x: midX, y: midY) }
//
//	@inlinable var minimum: Point { .init(x: minX, y: minY) }
//	@inlinable var maximum: Point { .init(x: maxX, y: maxY) }
//
//	@inlinable var path: Path { [ .move(to: start), .line(to: end) ] }
//
//	@inlinable init(from start: Point = .zero, to end: Point) {
//		self.start = start
//		self.end = end
//	}
//
////	@inlinable func applying(_ transform: Transform) -> Self {
////		let a = start.applying(transform)
////		let b = end.applying(transform)
////		return .init(from: a, to: b)
////	}
//}
