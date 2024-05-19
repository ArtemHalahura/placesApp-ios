import ProjectDescription

let project = Project(
    name: "PlacesApp",
    packages: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", .branch("main"))
    ],
    targets: [
        .target(
            name: "PlacesApp",
            destinations: .iOS,
            product: .app,
            bundleId: "homeAssignment.app.PlacesApp",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["PlacesApp/Sources/**"],
            resources: ["PlacesApp/Resources/**"],
            dependencies: [
                .package(product: "ComposableArchitecture")
            ]
        ),
        .target(
            name: "PlacesAppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "homeAssignment.app.PlacesAppTests",
            infoPlist: .default,
            sources: ["PlacesApp/Tests/**"],
            resources: [],
            dependencies: [.target(name: "PlacesApp")]
        ),
    ]
)
