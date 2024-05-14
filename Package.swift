// swift-tools-version:5.9
// swiftformat:disable all
import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "SpryKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v11),
        .macCatalyst(.v13),
        .tvOS(.v13),
        .watchOS(.v4)
    ],
    products: [
        .library(name: "SpryKit", targets: ["SpryKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/mattgallagher/CwlPreconditionTesting.git", .upToNextMinor(from: "2.2.1")),
        .package(url: "https://github.com/apple/swift-syntax.git", exact: "510.0.0")
    ],
    targets: [
        .macro(
            name: "SpryableMacro",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ],
            path: "Macro"
        ),
        .target(name: "SpryKit",
                dependencies: [
                    "CwlPreconditionTesting",
                    "SpryableMacro"
                ],
                path: "SpryKit",
                resources: [
                    .copy("../PrivacyInfo.xcprivacy")
                ]),
        .testTarget(name: "SpryKitTests",
                    dependencies: [
                        "SpryKit",
                        "SpryableMacro",
                        .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax")
                    ],
                    path: "SpryKitTests")
    ]
)
