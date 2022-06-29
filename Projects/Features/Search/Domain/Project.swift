import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .staticFramework(name: "SearchDomain",
                     dependencies: [
                        Dep.SPM.Needle
                     ])
