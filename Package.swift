// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SplatNet3",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15), .macOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SplatNet3",
            targets: ["SplatNet3", "SplatNet"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.6.0"),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess.git", from: "4.2.2"),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", from: "1.9.6"),
        .package(url: "https://github.com/SDBridge/SDBridgeSwift.git", from: "1.1.0"),
        .package(url: "https://github.com/stleamist/BetterSafariView.git", from: "2.4.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SplatNet",
            dependencies: [
                "Alamofire",
                "KeychainAccess",
                "SwiftyBeaver",
                "SDBridgeSwift",
                "BetterSafariView"
            ]),
        .target(
            name: "SplatNet3",
            dependencies: [
                "SplatNet"
            ]),
        .testTarget(
            name: "SplatNet3Tests",
            dependencies: ["SplatNet3"]),
    ]
)
