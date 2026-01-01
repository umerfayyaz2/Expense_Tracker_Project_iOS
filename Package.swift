// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "ExpenseTrackerApp",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "ExpenseTrackerApp",
            targets: ["ExpenseTrackerApp"]
        )
    ],
    targets: [
        .executableTarget(
            name: "ExpenseTrackerApp",
            path: "Sources/ExpenseTrackerApp"
        )
    ]
)
