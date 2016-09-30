
public struct Path/*: Primitive*/ {

	public enum Action: Sendable {
		case moveTo
		case addLine
		case addCurve
		case close
	}

	public struct Element: Sendable {

		public let action: Action
		public let points: [Point]

		@usableFromInline internal init(action: Action, points: [Point] = []) {
			self.action = action
			self.points = points
		}
	}

	public var storage: [Element]

	@inlinable public init(@PathBuilder build: () -> Path) {
		self = build()
	}

	@inlinable public init(_ elements: [Element] = []) {
		storage = elements
	}

	@inlinable public init(_ paths: [Path]) {
		storage = paths.flatMap(\.storage)
	}
}

// MARK: -

extension Path {

	@inlinable public mutating func append(@PathBuilder build: () -> Path) {
		let path = build()
		append(path)
	}

	@inlinable public mutating func append(_ elements: [Element]) {
		storage.append(contentsOf: elements)
	}

	@inlinable public mutating func append(_ path: Path) {
		storage.append(contentsOf: path.storage)
	}
}

// MARK: -

extension Path.Element {

	@inlinable public static func move(to point: Point) -> Self {
		.init(action: .moveTo, points: [point])
	}

	@inlinable public static func line(to point: Point) -> Self {
		.init(action: .addLine, points: [point])
	}

	@inlinable public static func curve(to point: Point, using control: Point) -> Self {
		.init(action: .addCurve, points: [control, point])
	}

	@inlinable public static func curve(to point: Point, using control1: Point, _ control2: Point) -> Self {
		.init(action: .addCurve, points: [control1, control2, point])
	}

	@inlinable public static func close() -> Self {
		.init(action: .close)
	}
}

// MARK: -

@resultBuilder public struct PathBuilder {

	public static func buildBlock(_ elements: Path.Element ...) -> Path {
		.init(elements)
	}

//	public static func buildBlock(_ elements: Path ...) -> Path {
//		.init(elements)
//	}
}
