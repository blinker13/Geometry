//
//public struct Space {
//
//	@inlinable public static var empty: Self {
//		.init(all: .zero)
//	}
//
//	public var top: Scalar
//	public var left: Scalar
//	public var bottom: Scalar
//	public var right: Scalar
//
//	public init(top: Scalar = .zero, left: Scalar = .zero, bottom: Scalar = .zero, right: Scalar = .zero) {
//		self.top = top
//		self.left = left
//		self.bottom = bottom
//		self.right = right
//	}
//
//	@inlinable public init(horizontal: Scalar = .zero, vertical: Scalar = .zero) {
//		self = .init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
//	}
//
//	@inlinable public init(all value: Scalar) {
//		self = .init(top: value, left: value, bottom: value, right: value)
//	}
//
//	public func rounded(_ rule: FloatingPointRoundingRule) -> Self {
//		.init()
//	}
//}
