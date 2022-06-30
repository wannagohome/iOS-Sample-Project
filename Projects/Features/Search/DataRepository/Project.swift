import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .staticFramework(name: "SearchDataRepository",
                     tests: nil,
                     packages: [],
                     dependencies: [
                        Dep.Project.Module.Rx,
                        Dep.Project.Module.Core,
                        Dep.Project.Feature.Search.Domain,
                     ])
