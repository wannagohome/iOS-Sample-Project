//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Jinho Jang on 2022/06/30.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "Core",
    platform: .iOS,
    resources: nil,
    tests: nil,
    packages: [],
    dependencies: [
        Dep.SPM.Needle,
        Dep.Project.Module.Coordinator
    ],
    infoPlist: [
        "CFBundleShortVersionString": .string("1.0.0"),
        "CFBundleVersion": .string("1"),
        "UILaunchStoryboardName": .string("LaunchScreen"),
        "UISupportedInterfaceOrientations": .array(["UIInterfaceOrientationPortrait"]),
    ],
    hasDemoApp: false
)

