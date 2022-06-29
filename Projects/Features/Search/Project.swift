import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "Search",
    platform: .iOS,
    dependencies: [
        Dep.Project.Feature.Search.Domain,
        Dep.Project.Feature.Search.DataRepository,
        Dep.Project.Feature.Search.UserInterface
    ],
    infoPlist: [
        "CFBundleShortVersionString": .string("1.0.0"),
        "CFBundleVersion": .string("1"),
        "UILaunchStoryboardName": .string("LaunchScreen"),
        "UISupportedInterfaceOrientations": .array(["UIInterfaceOrientationPortrait"]),
    ],
    hasDemoApp: true
)

