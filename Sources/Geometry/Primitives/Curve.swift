
public struct Curve: Primitive {

	public var storage: [Point]

	@inlinable public var start: Point {
		get { storage[storage.startIndex] }
		set { storage[storage.startIndex] = newValue }
	}

	@inlinable public var end: Point {
		get { storage[storage.endIndex - 1] }
		set { storage[storage.endIndex - 1] = newValue }
	}

	@inlinable public init(_ storage: [Point]) {
		precondition(storage.count > 2)
		self.storage = storage
	}
}

// MARK: -

extension Curve {

	@inlinable public static func + (lhs: Self, rhs: Point) -> Self {
		.init(lhs.storage + rhs)
	}

	@inlinable public static func - (lhs: Self, rhs: Point) -> Self {
		.init(lhs.storage - rhs)
	}

	@inlinable public static func quadratic(from start: Point, _ control: Point, to end: Point) -> Self {
		.init([start, control, end])
	}

	@inlinable public static func cubic(from start: Point, _ control1: Point, _ control2: Point, to end: Point) -> Self {
		.init([start, control1, control2, end])
	}
}
