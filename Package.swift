// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SwiftFixedRefreshControl",
    platforms: [
       .iOS(.v12)
    ],
    products: [
        .library(
            name: "SwiftFixedRefreshControl",
            targets: ["SwiftFixedRefreshControl"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftFixedRefreshControl"
        )
    ]
)
