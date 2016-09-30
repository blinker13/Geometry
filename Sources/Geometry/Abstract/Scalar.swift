
public struct Scalar: Arithmetic, Sendable {

	#if arch(i386) || arch(arm) || arch(wasm32) || arch(powerpc) || arch(arm64_32)
	public typealias Native = Float
	#elseif arch(x86_64) || arch(arm64) || arch(s390x) || arch(powerpc64) || arch(powerpc64le) || arch(riscv64)
	public typealias Native = Double
	#else
	#error("This architecture is not supported")
	#endif

	@usableFromInline internal var native: Native

	@inlinable public init(_ native: Native) {
		self.native = native
	}
}

// MARK: -

extension Scalar: BinaryFloatingPoint {

	@inlinable public static var exponentBitCount: Int {
		Native.exponentBitCount
	}

	@inlinable public static var greatestFiniteMagnitude: Self {
		.init(Native.greatestFiniteMagnitude)
	}

	@inlinable public static var infinity: Self {
		.init(Native.infinity)
	}

	@inlinable public static var leastNormalMagnitude: Self {
		.init(Native.leastNormalMagnitude)
	}

	@inlinable public static var leastNonzeroMagnitude: Self {
		.init(Native.leastNonzeroMagnitude)
	}

	@inlinable public static var nan: Self {
		.init(Native.nan)
	}

	@inlinable public static var pi: Self {
		.init(Native.pi)
	}

	@inlinable public static var signalingNaN: Self {
		.init(Native.signalingNaN)
	}

	@inlinable public static var significandBitCount: Int {
		Native.significandBitCount
	}

	@inlinable public static var tolerance: Self {
		.init(Native.ulpOfOne.squareRoot())
	}

	@inlinable public static func + (lhs: Self, rhs: Self) -> Self {
		.init(lhs.native + rhs.native)
	}

	@inlinable public static func - (lhs: Self, rhs: Self) -> Self {
		.init(lhs.native - rhs.native)
	}

	@inlinable public static func * (lhs: Self, rhs: Self) -> Self {
		.init(lhs.native * rhs.native)
	}

	@inlinable public static func / (lhs: Self, rhs: Self) -> Self {
		.init(lhs.native / rhs.native)
	}

	@inlinable public static func *= (lhs: inout Self, rhs: Self) {
		lhs.native *= rhs.native
	}

	@inlinable public static func /= (lhs: inout Self, rhs: Self) {
		lhs.native /= rhs.native
	}

	@inlinable public var binade: Self {
		.init(native.binade)
	}

	@inlinable public var exponent: Int {
		native.exponent
	}

	@inlinable public var exponentBitPattern: UInt {
		native.exponentBitPattern
	}

	@inlinable public var isCanonical: Bool {
		native.isCanonical
	}

	@inlinable public var isFinite: Bool {
		native.isFinite
	}

	@inlinable public var isInfinite: Bool {
		native.isInfinite
	}

	@inlinable public var isNaN: Bool {
		native.isNaN
	}

	@inlinable public var isNormal: Bool {
		native.isNormal
	}

	@inlinable public var isSignalingNaN: Bool {
		native.isSignalingNaN
	}

	@inlinable public var isSubnormal: Bool {
		native.isSubnormal
	}

	@inlinable public var isZero: Bool {
		native.isZero
	}

	@inlinable public var magnitude: Self {
		.init(abs(native))
	}

	@inlinable public var nextUp: Self {
		.init(native.nextUp)
	}

	@inlinable public var sign: FloatingPointSign {
		native.sign
	}

	@inlinable public var significandBitPattern: Native.RawSignificand {
		native.significandBitPattern
	}

	@inlinable public var significandWidth: Int {
		native.significandWidth
	}

	@inlinable public var significand: Self {
		.init(native.significand)
	}

	@inlinable public var ulp: Self {
		.init(native.ulp)
	}

	@inlinable public init?<Source>(exactly value: Source) where Source: BinaryFloatingPoint {
		guard let value = Native(exactly: value) else { return nil }
		native = value
	}

	@inlinable public init(sign: FloatingPointSign, exponentBitPattern: UInt, significandBitPattern: Native.RawSignificand) {
		native = .init(sign: sign, exponentBitPattern: exponentBitPattern, significandBitPattern: significandBitPattern)
	}

	@inlinable public init(sign: FloatingPointSign, exponent: Int, significand: Self) {
		native = .init(sign: sign, exponent: exponent, significand: significand.native)
	}

	@inlinable public func advanced(by n: Self) -> Self {
		.init(native + n.native)
	}

	@inlinable public func distance(to other: Self) -> Self {
		.init(other.native - native)
	}

	@inlinable public func isEqual(to other: Self) -> Bool {
		native.isEqual(to: other.native)
	}

	@inlinable public func isLess(than other: Self) -> Bool {
		native.isLess(than: other.native)
	}

	@inlinable public func isLessThanOrEqualTo(_ other: Self) -> Bool {
		native.isLessThanOrEqualTo(other.native)
	}

	@inlinable public mutating func addProduct(_ lhs: Self, _ rhs: Self) {
		native.addProduct(lhs.native, rhs.native)
	}

	@inlinable public mutating func formRemainder(dividingBy other: Self) {
		native.formRemainder(dividingBy: other.native)
	}

	@inlinable public mutating func formSquareRoot() {
		native.formSquareRoot()
	}

	@inlinable public mutating func formTruncatingRemainder(dividingBy other: Self) {
		native.formTruncatingRemainder(dividingBy: other.native)
	}

	@inlinable public mutating func round(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) {
		native.round(rule)
	}
}

// MARK: -

extension Scalar: Codable {

	public init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		
		do {
			native = try container.decode(Native.self)
		} catch DecodingError.typeMismatch(let kind, let context) {
			do {
				native = if Native.self == Float.self {
					.init(try container.decode(Double.self))
				} else {
					.init(try container.decode(Float.self))
				}
			} catch {
				throw DecodingError.typeMismatch(kind, context)
			}
		}
	}

	public func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(native)
	}
}

// MARK: -

extension Scalar: CustomStringConvertible {

	@inlinable public var description: String {
		native.description
	}
}

// MARK: -

extension Scalar: ExpressibleByFloatLiteral {

	@inlinable public init(floatLiteral value: Native) {
		self.init(value)
	}
}

// MARK: -

extension Scalar: ExpressibleByIntegerLiteral {

	@inlinable public init(integerLiteral value: Native) {
		self.init(value)
	}
}
