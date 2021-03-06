import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "Detail",
    platform: .iOS,
    resources: nil,
    tests: nil,
    packages: [],
    dependencies: [
        Dep.Project.Module.Rx,
        Dep.Project.Module.Core,
        Dep.SPM.SnapKit,
    ],
    infoPlist: [
        "CFBundleShortVersionString": .string("1.0.0"),
        "CFBundleVersion": .string("1"),
        "UILaunchStoryboardName": .string("LaunchScreen"),
        "UISupportedInterfaceOrientations": .array(["UIInterfaceOrientationPortrait"]),
    ],
    hasDemoApp: false
)

