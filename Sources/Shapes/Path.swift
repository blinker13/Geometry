//
//public struct Path : Equatable, ExpressibleByArrayLiteral {
//
//	public enum Element : Equatable {
//		case move(to: Point)
//		case line(to: Point)
//		case quadCurve(to: Point, Point)
//		case cubicCurve(to: Point, Point, Point)
//		case close
//	}
//
//	public let elements: [Element]
//
//	public init(with elements: [Element]) {
//		self.elements = elements
//	}
//
//	public init(from decoder: Decoder) throws {
//		#warning("Needs Implementation")
//		elements = []
//	}
//
//	public func encode(to encoder: Encoder) throws {
//		#warning("Needs Implementation")
//	}
//}
//
//// MARK: -
//
//public extension Path {
//
//	@inlinable var path: Path { self }
//
//	@inlinable init(with shape: Shape) {
//		self = shape.path
//	}
//
//	@inlinable init(with shapes: [Shape]) {
//		elements = shapes.flatMap(\.path.elements)
//	}
//
//	@inlinable init<Data : Sequence>(_ data: Data, build: (Data.Element) -> Shape) {
//		self.init(with: data.map(build))
//	}
//
//	@inlinable init(arrayLiteral elements: Element ...) {
//		self.elements = elements
//	}
//
//	@inlinable func transformed(by transform: Transform) -> Self {
//		#warning("Needs Implementation")
//		return self
//	}
//}
