import ProjectDescription
import UtilityPlugin

public extension Project {
    static func staticLibrary(name: String,
                              platform: Platform = .iOS,
                              sources: ProjectDescription.SourceFilesList? = ["Sources/**"],
                              resources: ProjectDescription.ResourceFileElements? = ["Resources/**"],
                              tests: ProjectDescription.SourceFilesList? = ["Tests/**"],
                              packages: [Package] = [],
                              dependencies: [TargetDependency] = [],
                              hasDemoApp: Bool = false) -> Self {
        return project(name: name,
                       packages: packages,
                       product: .staticLibrary,
                       platform: platform,
                       sources: sources,
                       resources: resources,
                       tests: tests,
                       dependencies: dependencies,
                       hasDemoApp: hasDemoApp)
    }
    
    static func staticFramework(name: String,
                                platform: Platform = .iOS,
                                sources: ProjectDescription.SourceFilesList? = ["Sources/**"],
                                resources: ProjectDescription.ResourceFileElements? = ["Resources/**"],
                                tests: ProjectDescription.SourceFilesList? = ["Tests/**"],
                                packages: [Package] = [],
                                dependencies: [TargetDependency] = [],
                                hasDemoApp: Bool = false) -> Self {
        return project(name: name,
                       packages: packages,
                       product: .staticFramework,
                       platform: platform,
                       sources: sources,
                       resources: nil,
                       tests: tests,
                       dependencies: dependencies,
                       hasDemoApp: hasDemoApp)
    }
    
    static func framework(name: String,
                          platform: Platform = .iOS,
                          sources: ProjectDescription.SourceFilesList? = ["Sources/**"],
                          resources: ProjectDescription.ResourceFileElements? = ["Resources/**"],
                          tests: ProjectDescription.SourceFilesList? = ["Tests/**"],
                          packages: [Package] = [],
                          dependencies: [TargetDependency] = [],
                          infoPlist: [String: InfoPlist.Value] = [:],
                          hasDemoApp: Bool = false) -> Self {
        return project(name: name,
                       packages: packages,
                       product: .framework,
                       platform: platform,
                       sources: sources,
                       resources: resources,
                       tests: tests, 
                       dependencies: dependencies,
                       infoPlist: infoPlist,
                       hasDemoApp: hasDemoApp)
    }
    
    static func app(name: String,
                    platform: Platform = .iOS,
                    sources: ProjectDescription.SourceFilesList? = ["Sources/**"],
                    resources: ProjectDescription.ResourceFileElements? = ["Resources/**"],
                    tests: ProjectDescription.SourceFilesList? = ["Tests/**"],
                    scripts: [ProjectDescription.TargetScript] = [],
                    packages: [Package] = [],
                    dependencies: [TargetDependency] = [],
                    infoPlist: [String: InfoPlist.Value] = [:]) -> Self {
        return project(name: name,
                       packages: packages,
                       product: .app,
                       platform: platform,
                       sources: sources,
                       resources: resources,
                       tests: tests,
                       scripts: scripts,
                       dependencies: dependencies,
                       infoPlist: infoPlist)
    }
}

public extension Project {
    static func project(name: String,
                        packages: [Package] = [],
                        product: Product,
                        platform: Platform = .iOS,
                        sources: ProjectDescription.SourceFilesList? = ["Sources/**"],
                        resources: ProjectDescription.ResourceFileElements? = ["Resources/**"],
                        tests: ProjectDescription.SourceFilesList? = ["Tests/**"],
                        scripts: [ProjectDescription.TargetScript] = [],
                        deploymentTarget: DeploymentTarget? = .iOS(targetVersion: "13.0", devices: .iphone),
                        dependencies: [TargetDependency] = [],
                        infoPlist: [String: InfoPlist.Value] = [:],
                        hasDemoApp: Bool = false) -> Project {
        
        let organizationName = "org.wannagohome"
        let isDynamic = product == .dynamicLibrary || product == .framework
        let settings: SettingsDictionary = isDynamic
        ? ["OTHER_LDFLAGS" : "$(inherited) -all_load"]
        : ["OTHER_LDFLAGS" : "$(inherited)"]
        
        let target1 = Target(name: name,
                             platform: platform,
                             product: product,
                             bundleId: "\(organizationName).\(name)",
                             deploymentTarget: deploymentTarget,
                             infoPlist: .extendingDefault(with: infoPlist),
                             sources: sources,
                             resources: resources,
                             scripts: scripts,
                             dependencies: dependencies,
                             settings: .settings(base: settings, defaultSettings: .recommended))
        
        let demoAppTarget = Target(name: "\(name)DemoApp",
                                   platform: platform,
                                   product: .app,
                                   bundleId: "\(organizationName).\(name)DemoApp",
                                   deploymentTarget: deploymentTarget,
                                   infoPlist: .extendingDefault(with: [
                                     "UILaunchStoryboardName": "LaunchScreen"
                                   ]),
                                   sources: ["DemoAppSources/**"],
                                   resources: resources,
                                   scripts: [.pre(script: """
                                                  export PATH="$PATH:/opt/homebrew/bin"
                                                  
                                                  needle generate ${PROJECT_DIR}/DemoAppSources/Generated/NeedleGenerated.swift ./
                                                  """, name: "Needle generate")],
                                   dependencies: [
                                    .target(name: "\(name)"),
                                    Dep.Project.Module.Core
                                   ],
                                   settings: .settings(base: settings, defaultSettings: .recommended))
        
        let testTargetDependencies: [TargetDependency] = hasDemoApp
            ? [.target(name: "\(name)DemoApp")]
            : [.target(name: "\(name)")]
        let testTarget = Target(name: "\(name)Tests",
                                platform: platform,
                                product: .unitTests,
                                bundleId: "\(organizationName).\(name)Tests",
                                deploymentTarget: deploymentTarget,
                                infoPlist: .default,
                                sources: tests,
                                dependencies: testTargetDependencies,
                                settings: .settings(base: settings, defaultSettings: .recommended))

        var targets: [Target] = hasDemoApp
            ? [target1, demoAppTarget]
            : [target1]
        if tests != nil {
            targets.append(testTarget)
        }
        
        return Project(name: name,
                       organizationName: organizationName,
                       packages: packages,
                       targets: targets)
    }
}
