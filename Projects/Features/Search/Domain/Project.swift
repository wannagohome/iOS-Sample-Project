import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .framework(name: "SearchDomain",
                     dependencies: [
                        Dep.Project.Module.Core,
                     ])
