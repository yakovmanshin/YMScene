// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "YMScene",
    platforms: [
        .iOS(.v8),
    ],
    products: [
        .library(
            name: "YMScene",
            targets: ["YMScene"]
        ),
    ],
    targets: [
        .target(
            name: "YMScene"
        ),
    ]
)
