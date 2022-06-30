//
//  RootComponent.swift
//  UserInterface
//
//  Created by Jinho Jang on 2022/06/22.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import Foundation
import NeedleFoundation
import UIKit

import SearchDataRepository

public protocol UIDependency: Dependency {
    var dataComponent: SearchDataBuilder { get }
}

public protocol UIBuilder {
    func searchViewController(_ delegate: SearchReactorDelegate) -> SearhViewControllerType
}

public final class UIComponent: Component<UIDependency>, UIBuilder {
    public func searchViewController(_ delegate: SearchReactorDelegate) -> SearhViewControllerType {
        let reactor = SearchReactor(repository: dependency.dataComponent.repository)
        reactor.delegate = delegate
        return SearchViewController(reactor: reactor)
    }
}
