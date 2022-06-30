// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "Rx",
    platform: .iOS,
    resources: nil,
    tests: nil,
    packages: [],
    dependencies: [
        Dep.SPM.RxSwift,
        Dep.SPM.RxCocoa,
        Dep.SPM.ReactorKit,
    ],
    infoPlist: [
        "CFBundleShortVersionString": .string("1.0.0"),
        "CFBundleVersion": .string("1"),
        "UILaunchStoryboardName": .string("LaunchScreen"),
        "UISupportedInterfaceOrientations": .array(["UIInterfaceOrientationPortrait"]),
    ],
    hasDemoApp: false
)
