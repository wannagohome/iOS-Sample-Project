//
//  AppCoordinator.swift
//  SearchDemoApp
//
//  Created by Jinho Jang on 2022/07/01.
//  Copyright © 2022 org.wannagohome. All rights reserved.
//

import Coordinator
import UIKit

import Search
import SearchDomain

final class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private let component: RootComponent
    
    init(
        _ component: RootComponent = RootComponent(),
        rootWindow: UIWindow
    ) {
        self.component = component
        self.navigationController = component.navigationController
        rootWindow.rootViewController = component.navigationController
        rootWindow.makeKeyAndVisible()
    }
    
    func start() {
        let coordinator = component.searchComponent.searchCoordinator
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    private func presentDetailViewController(of word: Word) {}
}

extension AppCoordinator: SearchCoordinatorDelegate {
    func selectWord(_ word: Word) {
        presentDetailViewController(of: word)
    }
}

