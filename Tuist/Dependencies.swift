//
//  Dependencies.swift
//  SearchManifests
//
//  Created by Jinho Jang on 2022/06/20.
//

import ProjectDescription
import UtilityPlugin

let dependencies = Dependencies(
    swiftPackageManager: .init(
        [
            Package.Needle,
            Package.RxSwift,
            Package.SnapKit,
            Package.ReactorKit,
        ],
        productTypes: ["NeedleFoundation": .staticLibrary,
                       "RxSwift": .staticLibrary,
                       "RxCocoa": .staticLibrary,
                       "RxRelay": .staticLibrary,
                       "RxTest": .staticLibrary,
                       "SnapKit": .staticLibrary,
                       "ReactorKit": .staticLibrary,]
    ),
    platforms: [.iOS]
)
