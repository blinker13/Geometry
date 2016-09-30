
public struct Scalar: Primitive {

	#if arch(i386) || arch(arm) || arch(wasm32) || arch(powerpc) || arch(arm64_32)
	public var storage: Float
	#elseif arch(x86_64) || arch(arm64) || arch(s390x) || arch(powerpc64) || arch(powerpc64le) || arch(riscv64)
	public var storage: Double
	#else
	#error("This architecture is not supported")
	#endif

	@inlinable public init(_ storage: Storage) {
		self.storage = storage
	}
}

// MARK: -

public typealias Scalar2D = (Scalar, Scalar)

// MARK: -

extension Scalar: BinaryFloatingPoint {

	@inlinable public static var pi: Self {
		.init(Storage.pi)
	}

	@inlinable public static var exponentBitCount: Int {
		Storage.exponentBitCount
	}

	@inlinable public static var significandBitCount: Int {
		Storage.significandBitCount
	}

	@inlinable public static var greatestFiniteMagnitude: Self {
		.init(Storage.greatestFiniteMagnitude)
	}

	@inlinable public static var leastNormalMagnitude: Self {
		.init(Storage.leastNormalMagnitude)
	}

	@inlinable public static var leastNonzeroMagnitude: Self {
		.init(Storage.leastNonzeroMagnitude)
	}

	@inlinable public static var nan: Self {
		.init(Storage.nan)
	}

	@inlinable public static var signalingNaN: Self {
		.init(Storage.signalingNaN)
	}

	@inlinable public var exponent: Int {
		storage.exponent
	}

	@inlinable public var binade: Self {
		.init(storage.binade)
	}

	@inlinable public var significandBitPattern: UInt {
		.init(storage.significandBitPattern)
	}

	@inlinable public var significandWidth: Int {
		storage.significandWidth
	}

	@inlinable public var ulp: Self {
		.init(storage.ulp)
	}

	@inlinable public var sign: FloatingPointSign {
		storage.sign
	}

	@inlinable public var exponentBitPattern: UInt {
		storage.exponentBitPattern
	}

	@inlinable public var significand: Self {
		.init(storage.significand)
	}

	@inlinable public var isNormal: Bool {
		storage.isNormal
	}

	@inlinable public var isSubnormal: Bool {
		storage.isSubnormal
	}

	@inlinable public var isNaN: Bool {
		storage.isNaN
	}

	@inlinable public var isSignalingNaN: Bool {
		storage.isSignalingNaN
	}

	@inlinable public var isCanonical: Bool {
		storage.isCanonical
	}

	@inlinable public var nextUp: Self {
		.init(storage.nextUp)
	}

	@inlinable public var magnitude: Self {
		.init(abs(storage))
	}

	@inlinable public init(sign: FloatingPointSign, exponentBitPattern: UInt, significandBitPattern: UInt) {
		let pattern = Storage.RawSignificand(significandBitPattern)
		storage = .init(sign: sign, exponentBitPattern: exponentBitPattern, significandBitPattern: pattern)
	}

	@inlinable public init(sign: FloatingPointSign, exponent: Int, significand: Self) {
		storage = .init(sign: sign, exponent: exponent, significand: significand.storage)
	}

	public init?<T>(exactly source: T) where T : BinaryInteger {
		guard let value = Storage(exactly: source) else {
			return nil
		}

		storage = value
	}

	@inlinable public func isEqual(to other: Self) -> Bool {
		storage.isEqual(to: other.storage)
	}

	@inlinable public func isLess(than other: Self) -> Bool {
		storage.isLess(than: other.storage)
	}

	@inlinable public func isLessThanOrEqualTo(_ other: Self) -> Bool {
		storage.isLessThanOrEqualTo(other.storage)
	}

	@inlinable public mutating func formRemainder(dividingBy other: Self) {
		storage.formRemainder(dividingBy: other.storage)
	}
	
	@inlinable public mutating func formTruncatingRemainder(dividingBy other: Self) {
		storage.formTruncatingRemainder(dividingBy: other.storage)
	}
	
	@inlinable public mutating func formSquareRoot() {
		storage.formSquareRoot()
	}
	
	@inlinable public mutating func addProduct(_ lhs: Self, _ rhs: Self) {
		storage.addProduct(lhs.storage, rhs.storage)
	}
}

// MARK: -

extension Scalar: Codable {

	public init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		
		do {
			storage = try container.decode(Storage.self)
		} catch DecodingError.typeMismatch(let kind, let context) {
			do {
				storage = if Storage.self == Float.self {
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
		try container.encode(storage)
	}
}

// MARK: -

extension Scalar: CustomStringConvertible {
	@inlinable public var description: String {
		storage.description
	}
}

// MARK: -

extension Scalar: ExpressibleByFloatLiteral {
	@inlinable public init(floatLiteral value: FloatLiteralType) {
		storage = .init(value)
	}
}

// MARK: -

extension Scalar: ExpressibleByIntegerLiteral {
	@inlinable public init(integerLiteral value: IntegerLiteralType) {
		storage = .init(value)
	}
}
