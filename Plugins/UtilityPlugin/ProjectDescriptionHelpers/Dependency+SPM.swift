//
//  Dependency+SPM.swift
//  UtilityPlugin
//
//  Created by Jinho Jang on 2022/06/20.
//

import Foundation
import ProjectDescription

// MARK: - Group
extension Dep {
    public struct SPM {
    }
}
//extension Package {}


// MARK: - Swift Package

public extension Dep.SPM {
    static let Needle = Dep.external(name: "NeedleFoundation")
    static let RxSwift = Dep.external(name: "RxSwift")
    static let RxCocoa = Dep.external(name: "RxCocoa")
    static let RxTest = Dep.external(name: "RxTest")
    static let SnapKit = Dep.external(name: "SnapKit")
    static let ReactorKit = Dep.external(name: "ReactorKit")
}

public extension Package {
    static let Needle = Package.package(
        url: "https://github.com/uber/needle.git",
        .exact("0.18.0")
    )
    
    static let RxSwift = Package.package(
        url: "https://github.com/ReactiveX/RxSwift.git",
        .exact("6.5.0")
    )
    
    static let SnapKit = Package .package(
        url: "https://github.com/SnapKit/SnapKit.git",
        .exact("5.0.1")
    )
    
    static let ReactorKit = Package .package(
        url: "https://github.com/ReactorKit/ReactorKit.git",
        .exact("3.0.0")
    )
}
