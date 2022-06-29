import Foundation
import ProjectDescription

public extension ProjectDescription.Path {
    static func relativeToFeature(name: String, pathString: String) -> Self {
        return .relativeToRoot("Projects/Features/\(pathString)")
    }
    
    static func relativeToModule(name: String, pathString: String) -> Self {
        return .relativeToRoot("Projects/Modules/\(pathString)")
    }
}

// MARK: Extension
extension Dep {
    static func feature(name: String, path: String) -> Self {
        return .project(target: name, path: .relativeToFeature(name: name, pathString: path))
    }
    
    static func module(name: String, path: String) -> Self {
        return .project(target: name, path: .relativeToModule(name: name, pathString: path))
    }
}
