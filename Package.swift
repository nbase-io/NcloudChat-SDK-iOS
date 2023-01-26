// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NcloudChat",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "NcloudChat",
            targets: ["NcloudChat"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0"),
        .package(url: "https://github.com/apollographql/apollo-ios.git", exact: "0.53.0"),
        .package(url: "https://github.com/socketio/socket.io-client-swift.git", branch: "master")

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "NcloudChat", dependencies: [
            .product(name: "Alamofire", package: "alamofire"),
            .product(name: "Apollo", package: "apollo-ios"),
            .product(name: "SocketIO", package: "socket.io-client-swift")
        ]
       )
    ]
)
