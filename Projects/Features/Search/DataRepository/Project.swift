import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project
    .staticFramework(name: "SearchDataRepository",
                     dependencies: [
                        Dep.SPM.Needle,
                        Dep.SPM.RxSwift,
                        Dep.Project.Feature.Search.Domain,
                     ])
