// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "HackerNewsKit",
    products: [
        .library(name: "HackerNewsKit", targets: ["HackerNewsKit"]),
    ],
    targets: [
        .target(name: "HackerNewsKit", dependencies: []),
        .testTarget(name: "HackerNewsKitTests", dependencies: ["HackerNewsKit"]),
    ]
)
