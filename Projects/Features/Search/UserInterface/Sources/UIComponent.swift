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
    var reactorDelegate: SearchReactorDelegate { get }
    var dataComponent: SearchDataBuilder { get }
}

public protocol UIBuilder {
    var searchViewController: SearhViewControllerType { get }
}

public final class UIComponent: Component<UIDependency>, UIBuilder {
    public var searchViewController: SearhViewControllerType {
        let reactor = SearchReactor(repository: dependency.dataComponent.repository)
        reactor.delegate = dependency.reactorDelegate
        return SearchViewController(reactor: reactor)
    }
}
