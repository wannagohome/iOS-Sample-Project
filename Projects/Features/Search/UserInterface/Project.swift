import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .staticFramework(name: "SearchUserInterface",
                     dependencies: [
                        Dep.SPM.Needle,
                        Dep.SPM.RxCocoa,
                        Dep.SPM.SnapKit,
                        Dep.SPM.ReactorKit,
                        Dep.Project.Module.Coordinator,
                        Dep.Project.Feature.Search.Domain,
                        Dep.Project.Feature.Search.DataRepository,
                     ])
