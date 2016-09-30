// swift-tools-version:5.10
import PackageDescription

_ = Package(
	name: "Geometry",
	
	products: [
		.library(
			name: "Geometry",
			targets: [
				"Core",
				"Geometries",
//				"Shapes",
			]
		)
	],
	
	targets: [
		.target(name: "Core"),
		.target(name: "Geometries"),
//		.target(name: "Shapes"),

		.testTarget(
			name: "Tests",
			dependencies: [
				"Core",
				"Geometries",
//				"Shapes",
			],
			path: "Tests"
		)
	]
)
