// swift-tools-version: 5.9
// This is a Skip (https://skip.tools) package,
// containing a Swift Package Manager project
// that will use the Skip build plugin to transpile the
// Swift Package, Sources, and Tests into an
// Android Gradle Project with Kotlin sources and JUnit tests.
import PackageDescription

let package = Package(
    name: "club-life",
    defaultLocalization: "en",
    platforms: [.iOS(.v17), .macOS(.v14), .tvOS(.v17), .watchOS(.v10), .macCatalyst(.v17)],
    products: [
        .library(name: "ClubLifeSwiftRewriteApp", type: .dynamic, targets: ["ClubLifeSwiftRewrite"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.2.0"),
        .package(url: "https://source.skip.tools/skip-ui.git", from: "1.0.0"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "1.0.0"),
        .package(url: "https://source.skip.tools/skip-model.git", from: "1.0.0"),
        .package(url: "https://source.skip.tools/skip-sql.git", from: "0.0.0"),
        .package(url: "https://github.com/JWAutumn/ACarousel", from: "0.1.3")
    ],
    targets: [
        .target(name: "ClubLifeSwiftRewrite", dependencies: [
            .product(name: "SkipUI", package: "skip-ui"),
            .product(name: "SkipSQL", package: "skip-sql"),
            .product(name: "SkipSQLPlus", package: "skip-sql"),
            .product(name: "ACarousel", package: "acarousel")
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "ClubLifeSwiftRewriteTests", dependencies: [
            "ClubLifeSwiftRewrite",
            .product(name: "SkipTest", package: "skip")
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
//        .target(name: "UserDataViewModel", dependencies: [
//            .product(name: "SkipUI", package: "skip-ui"),
//            .product(name: "SkipSQL", package: "skip-sql"),
//            .product(name: "SkipSQLPlus", package: "skip-sql")
//        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
//        .testTarget(name: "UserDataViewModelTests", dependencies: [
//            "UserDataViewModel",
//            .product(name: "SkipTest", package: "skip")
//        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)
