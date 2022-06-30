import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .staticFramework(name: "SearchDomain",
                     tests: nil,
                     dependencies: [
                        Dep.Project.Module.Core,
                     ])
