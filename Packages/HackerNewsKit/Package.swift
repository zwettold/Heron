// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "HackerNewsKit",
    platforms: [.macOS(.v10_15), .iOS(.v13), .watchOS(.v6), .tvOS(.v13)],
    products: [
        .library(name: "HackerNewsKit", targets: ["HackerNewsKit"])
    ],
    targets: [
        .target(name: "HackerNewsKit", dependencies: []),
        .testTarget(name: "HackerNewsKitTests", dependencies: ["HackerNewsKit"]),
    ]
)
