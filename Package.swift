// swift-tools-version:5.6
// swiftformat:disable all
import PackageDescription

let package = Package(
    name: "NSpry",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "NSpry", targets: ["NSpry"]),
        .library(name: "NSpry_Nimble", targets: ["NSpry_Nimble"])
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "6.1.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "11.2.1"))
    ],
    targets: [
        .target(name: "NSpry",
                dependencies: [
                ],
                path: "Source/Core"),
        .target(name: "NSpry_Nimble",
                dependencies: [
                    "NSpry",
                    "Nimble"
                ],
                path: "Source/Nimble"),
        .testTarget(name: "NSpryTests",
                    dependencies: [
                        "NSpry",
                        "NSpry_Nimble",
                        "Nimble",
                        "Quick"
                    ],
                    path: "Tests")
    ]
)
