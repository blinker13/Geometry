
public struct Rect: Primitive {

	public var storage: Storage<Point, Size>

	@inlinable public var origin: Point {
		get { storage.value.0 }
		set { storage.value.0 = newValue }
	}

	@inlinable public var size: Size {
		get { storage.value.1 }
		set { storage.value.1 = newValue }
	}

	@inlinable public init(_ storage: Storage<Point, Size>) {
		self.storage = storage
	}

	@inlinable public init(origin: Point = .zero, size: Size) {
		self.storage = .init(origin, size)
	}

	@inlinable public init(origin: Point = .zero, sides: Scalar) {
		self.storage = .init(origin, .init(same: sides))
	}

	@inlinable public init(x: Scalar = .zero, y: Scalar = .zero, width: Scalar, height: Scalar) {
		self.storage = .init(.init(x: x, y: y), .init(width: width, height: height))
	}

	@inlinable public init(x: Scalar = .zero, y: Scalar = .zero, size: Size) {
		self.storage = .init(.init(x: x, y: y), size)
	}

	@inlinable public init(center: Point = .zero, size: Size) {
		let origin = Point(x: center.x - size.width * 0.5, y: center.y - size.height * 0.5)
		self.storage = .init(origin, size)
	}

	@inlinable public init(center: Point = .zero, radius: Scalar) {
		let origin = Point(x: center.x - radius, y: center.y - radius)
		self.storage = .init(origin, .init(same: radius * 2))
	}
}

// MARK: -

extension Rect {

	@inlinable public var isNull: Bool {
		origin.isInfinite
	}

	@inlinable public var isEmpty: Bool {
		size.isEmpty || isNull
	}



	@inlinable public var x: Scalar { origin.x }
	@inlinable public var y: Scalar { origin.y }

	@inlinable public var width: Scalar { abs(size.width) }
	@inlinable public var height: Scalar { abs(size.height) }

	@inlinable public var minX: Scalar { min(x, x + size.width) }
	@inlinable public var minY: Scalar { min(y, y + size.height) }
	@inlinable public var midX: Scalar { (minX + maxX) * 0.5 }
	@inlinable public var midY: Scalar { (minY + maxY) * 0.5 }
	@inlinable public var maxX: Scalar { max(x, x + size.width) }
	@inlinable public var maxY: Scalar { max(y, y + size.height) }

	@inlinable public var center: Point { .init(x: midX, y: midY) }

	@inlinable public var horizontal: Range<Scalar> { minX ..< maxX }
	@inlinable public var vertical: Range<Scalar> { minY ..< maxY }

//	@inlinable var path: Path {
//		[
//			.move(to: .init(x: minX, y: minY)),
//			.line(to: .init(x: maxX, y: minY)),
//			.line(to: .init(x: maxX, y: maxY)),
//			.line(to: .init(x: minX, y: maxY)),
//			.close
//		]
//	}

	@inlinable func contains(_ point: Point) -> Bool {
		vertical.contains(point.x) && horizontal.contains(point.y)
	}

//	@inlinable func inseted(by space: Space) -> Self {
//		let new = Point(origin.storage + space.storage.highHalf)
//		return .init(origin: new, size: size.inseted(by: space))
//	}

//	@inlinable func applying(_ transform: Transform) -> Self {
//		let newOrigin = origin.applying(transform)
//		let newSize = size.applying(transform)
//		return .init(origin: newOrigin, size: newSize)
//	}
}
