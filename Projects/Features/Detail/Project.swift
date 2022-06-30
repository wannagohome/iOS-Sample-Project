import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "Detail",
    platform: .iOS,
    resources: nil,
    tests: nil,
    dependencies: [
        Dep.SPM.Needle,
        Dep.SPM.SnapKit,
        Dep.Project.Module.Coordinator,
    ],
    infoPlist: [
        "CFBundleShortVersionString": .string("1.0.0"),
        "CFBundleVersion": .string("1"),
        "UILaunchStoryboardName": .string("LaunchScreen"),
        "UISupportedInterfaceOrientations": .array(["UIInterfaceOrientationPortrait"]),
    ],
    hasDemoApp: false
)

