import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .staticFramework(name: "SearchUserInterface",
                     tests: nil,
                     packages: [],
                     dependencies: [    
                        Dep.Project.Module.Core,
                        Dep.SPM.SnapKit,
                        Dep.Project.Module.Rx,
                        Dep.Project.Feature.Search.Domain,
                        Dep.Project.Feature.Search.DataRepository,
                     ])
