// swift-tools-version:5.3
import PackageDescription

_ = Package(
	name: "Geometry",

	products: [
		.library(name: "Geometry", targets: ["Geometry"])
	],

	targets: [
		.target(name: "Geometry", path: "Sources"),
		.testTarget(name: "Tests", dependencies: ["Geometry"], path: "Tests")
	]
)
