// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "HackerNewsKit",
    platforms: [.macOS(.v12), .iOS(.v15), .watchOS(.v8), .tvOS(.v15)],
    products: [
        .library(name: "HackerNewsKit", targets: ["HackerNewsKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/WeTransfer/Mocker.git", from: "2.5.6")
    ],
    targets: [
        .target(name: "HackerNewsKit", dependencies: []),
        .testTarget(name: "HackerNewsKitTests", dependencies: ["HackerNewsKit", "Mocker"]),
    ]
)
