// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Refreshable",
    platforms: [
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "Refreshable",
            targets: ["Refreshable"]
        ),
    ],
    targets: [
        .target(name: "Refreshable")
    ]
)
