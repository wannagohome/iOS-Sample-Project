import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.app(
    name: "Application",
    platform: .iOS,
    sources: ["Projects/Application/Sources/**"],
    resources: nil,
    tests: ["Projects/Application/Tests/**"],
    scripts: [.pre(script: """
                   export PATH="$PATH:/opt/homebrew/bin"
                   
                   needle generate Projects/Application/Sources/Generated/NeedleGenerated.swift Projects/
                   """, name: "Needle generate")],
    dependencies: [
        Dep.Project.Module.Coordinator,
        Dep.Project.Feature.Search.HoleFeature,
        Dep.Project.Feature.Detail.HoleFeature,
    ],
    infoPlist: [
        "CFBundleShortVersionString": .string("1.0.0"),
        "CFBundleVersion": .string("1"),
        "UILaunchStoryboardName": .string("LaunchScreen"),
        "UISupportedInterfaceOrientations": .array(["UIInterfaceOrientationPortrait"]),
        "UISupportedInterfaceOrientations~ipad": .array([]),
        "UIUserInterfaceStyle": .string("Light"),
    ]
)

