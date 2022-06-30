

import Detail
import Foundation
import NeedleFoundation
import Search
import SearchDataRepository
import SearchDomain
import SearchUserInterface
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->SearchComponent->SearchDataComponent") { component in
        return SearchDataDependencycf3d89c736b0c315e515Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->SearchComponent") { component in
        return SearchDependencyf947dc409bd44ace18e0Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->SearchComponent->UIComponent") { component in
        return UIDependency091c9d51cd6e95ac8dc9Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->DetailComponent") { component in
        return DetailDependencyb171f3bdca6113e7a5d9Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    
}

// MARK: - Providers

private class SearchDataDependencycf3d89c736b0c315e515BaseProvider: SearchDataDependency {


    init() {

    }
}
/// ^->RootComponent->SearchComponent->SearchDataComponent
private class SearchDataDependencycf3d89c736b0c315e515Provider: SearchDataDependencycf3d89c736b0c315e515BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class SearchDependencyf947dc409bd44ace18e0BaseProvider: SearchDependency {
    var navigationController: UINavigationController {
        return rootComponent.navigationController
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->SearchComponent
private class SearchDependencyf947dc409bd44ace18e0Provider: SearchDependencyf947dc409bd44ace18e0BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
private class UIDependency091c9d51cd6e95ac8dc9BaseProvider: UIDependency {
    var reactorDelegate: SearchReactorDelegate {
        return searchComponent.reactorDelegate
    }
    var dataComponent: SearchDataBuilder {
        return searchComponent.dataComponent
    }
    private let searchComponent: SearchComponent
    init(searchComponent: SearchComponent) {
        self.searchComponent = searchComponent
    }
}
/// ^->RootComponent->SearchComponent->UIComponent
private class UIDependency091c9d51cd6e95ac8dc9Provider: UIDependency091c9d51cd6e95ac8dc9BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(searchComponent: component.parent as! SearchComponent)
    }
}
private class DetailDependencyb171f3bdca6113e7a5d9BaseProvider: DetailDependency {


    init() {

    }
}
/// ^->RootComponent->DetailComponent
private class DetailDependencyb171f3bdca6113e7a5d9Provider: DetailDependencyb171f3bdca6113e7a5d9BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
