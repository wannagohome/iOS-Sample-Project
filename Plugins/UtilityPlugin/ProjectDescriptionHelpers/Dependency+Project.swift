import Foundation
import ProjectDescription

// MARK: Project
extension Dep {
    public struct Project {
        public struct Feature {
            public struct Search {}
        }
        public struct Module {
            
        }
    }
}

public extension Dep.Project.Feature {
//    static let Features = Dep.feature(name: "Features")
}

public extension Dep.Project.Feature.Search {
    static let group = "Search"
    
    static let HoleFeature    = Dep.feature(name: "Search", path: "\(group)")
    static let UserInterface  = Dep.feature(name: "SearchUserInterface", path: "\(group)/UserInterface")
    static let Domain         = Dep.feature(name: "SearchDomain", path: "\(group)/Domain")
    static let DataRepository = Dep.feature(name: "SearchDataRepository", path: "\(group)/DataRepository")
    static let Pacakge: [Dep] = [UserInterface, Domain, DataRepository]
}

public extension Dep.Project.Module {
    static let Coordinator = Dep.module(name: "Coordinator", path: "Coordinator")
}
