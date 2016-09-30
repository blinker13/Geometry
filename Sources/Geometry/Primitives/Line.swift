
public struct Line: Primitive {

	public var storage: Storage<Point, Point>

	@inlinable public var start: Point {
		get { storage.value.0 }
		set { storage.value.0 = newValue }
	}

	@inlinable public var end: Point {
		get { storage.value.1 }
		set { storage.value.1 = newValue }
	}

	@inlinable public init(_ storage: Storage<Point, Point>) {
		self.storage = storage
	}

	@inlinable public init(from start: Point = .zero, to end: Point) {
		self.storage = .init(start, end)
	}
}

// MARK: -

extension Line {

	@inlinable public var isHorizontal: Bool {
		start.y == end.y
	}

	@inlinable public var isVertical: Bool {
		start.x == end.x
	}

//	@inlinable public var minX: Scalar { min(start.x, end.x) }
//	@inlinable public var minY: Scalar { min(start.y, end.y) }
//	@inlinable public var midX: Scalar { (start.x + end.x) * 0.5 }
//	@inlinable public var midY: Scalar { (start.y + end.y) * 0.5 }
//	@inlinable public var maxX: Scalar { max(start.x, end.x) }
//	@inlinable public var maxY: Scalar { max(start.y, end.y) }
//
//	@inlinable public var center: Point { .init(x: midX, y: midY) }
//
//	@inlinable public var minimum: Point { .init(x: minX, y: minY) }
//	@inlinable public var maximum: Point { .init(x: maxX, y: maxY) }

//	@inlinable var path: Path { [ .move(to: start), .line(to: end) ] }

	@inlinable public func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Self {
		.init(from: start.rounded(rule), to: end.rounded(rule))
	}
}

// MARK: -

extension Line: CustomDebugStringConvertible {

	public var debugDescription: String {
		"(\(start), \(end))"
	}
}
