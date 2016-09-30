
import Core
import XCTest

final class ScalarTests : XCTestCase {

	func testStorageType() {
		#if arch(i386) || arch(arm) || arch(wasm32) || arch(powerpc) || arch(arm64_32)
		XCTAssert(Scalar.Storage.self == Float.self)
		#elseif arch(x86_64) || arch(arm64) || arch(s390x) || arch(powerpc64) || arch(powerpc64le) || arch(riscv64)
		XCTAssert(Scalar.Storage.self == Double.self)
		#else
		XCTAssert(false)
		#endif
	}

	func testInitWith() {
		let subject = Scalar(13.0)
		XCTAssert(subject.storage == 13.0)
	}
}
