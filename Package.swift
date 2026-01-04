// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ExpenseTrackerApp",
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
