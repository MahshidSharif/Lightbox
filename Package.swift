// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Lightbox",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "Lightbox",
            targets: ["Lightbox"]),
    ],
    
    dependencies: [
        .package(
            url: "https://nebula.orchidpharmed.com/Orchid%20Pharmed/Nova/_git/Nova.OnlineVisit.iOS.AUIKit",
            from: "0.8.4"),
    ],
    
    targets: [
        .target(
            name: "Lightbox",
            dependencies: ["AUIKit"],
            path: "Source")
    ],
    swiftLanguageVersions: [.v5]
)
