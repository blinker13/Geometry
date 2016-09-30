// swift-tools-version: 6.0
import PackageDescription

_ = Package(
	name: "Geometry",

	platforms: [
		.iOS(.v17),
		.macOS(.v14),
	],

	products: [
		.library(name: "Geometry", targets: [
			"Geometry",
		]),
	],

	dependencies: [
		.package(url: "https://github.com/apple/swift-numerics", from: "1.0.0"),
	],

	targets: [
		.target(name: "Geometry", dependencies: [
			.product(name: "RealModule", package: "swift-numerics"),
		]),

		.testTarget(name: "GeometryTests", dependencies: [
			"Geometry",
		]),
	]
)
