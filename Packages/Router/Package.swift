// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Router",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Router",
            targets: ["Router"]),
    ],
    dependencies: [
     .package(path: "../../CharactersList"),
     .package(path: "../../Commons"),
     .package(path: "../../AppCore"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Router",
            dependencies: [
              .product(name: "CharactersList", package: "CharactersList"),
              .product(name: "Commons", package: "Commons"),
              .product(name: "AppCore", package: "AppCore"),
            ]
        ),
        .testTarget(
            name: "RouterTests",
            dependencies: ["Router"]),
    ]
)
