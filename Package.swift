// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftUIOSUtil",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v13)
  ],
  products: [
    .library(
      name: "SwiftUIOSUtil", targets: ["SwiftUIOSUtil"]),
  ],
  dependencies: [
    .package(url: "https://github.com/nalexn/ViewInspector.git", from: "0.7.0")
  ],
  targets: [
    .target(
      name: "SwiftUIOSUtil", dependencies: []),
    .testTarget(
      name: "SwiftUIOSUtilTests", dependencies: ["SwiftUIOSUtil", "ViewInspector"]),
  ]
)
