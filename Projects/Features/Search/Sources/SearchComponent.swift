//
//  SearchComponent.swift
//  Search
//
//  Created by Jinho Jang on 2022/06/23.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import UIKit
import NeedleFoundation

import SearchUserInterface
import SearchDataRepository

public protocol SearchDependency: Dependency {
    var navigationController: UINavigationController { get }
}

public protocol SearchBuilder {
    var uiComponent: UIBuilder { get }
    var dataComponent: SearchDataBuilder { get }
    var searchCoordinator: SearchCoordinator { get }
}

public final class SearchComponent: Component<SearchDependency>, SearchBuilder {
    
    public var uiComponent: UIBuilder {
        UIComponent(parent: self)
    }
    
    public var dataComponent: SearchDataBuilder {
        SearchDataComponent(parent: self)
    }
    
    public var searchCoordinator: SearchCoordinator {
        shared { SearchCoordinator(
            navigationController: dependency.navigationController,
            component: self
        )}
    }
    
    public var reactorDelegate: SearchReactorDelegate {
        searchCoordinator
    }
}
