// swift-tools-version:5.9
//
// BluefinPayconex SDK - SwiftPM manifest. Zero runtime dependencies (Foundation +
// the vendored Voxgig Struct port under Sources/ProjectNameSDK/Struct).
import PackageDescription

let package = Package(
    name: "BluefinPayconexSdk",
    products: [
        .library(name: "BluefinPayconexSdk", targets: ["BluefinPayconexSdk"]),
    ],
    targets: [
        .target(
            name: "BluefinPayconexSdk",
            path: "Sources/ProjectNameSDK"),
        .testTarget(
            name: "BluefinPayconexSdkTests",
            dependencies: ["BluefinPayconexSdk"],
            path: "Tests/ProjectNameSDKTests"),
    ]
)
