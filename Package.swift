// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "YMScene",
    platforms: [
        .iOS(.v11),
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
