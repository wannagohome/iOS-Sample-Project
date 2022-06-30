//
//  AppCoordinator.swift
//  Application
//
//  Created by Jinho Jang on 2022/06/28.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import Coordinator
import UIKit

import Search
import SearchDomain
import Detail

final class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private let component: RootComponent
    
    init(_ navigationController: UINavigationController) {
        let component = RootComponent()
        self.component = component
        self.navigationController = navigationController
    }
    
    func start() {
        let coordinator = SearchCoordinator(
            navigationController: navigationController,
            component: component.searchComponent
        )
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    private func presentDetailViewController(of word: Word) {
        var component = component.detailComponent
        component.model = word
        
        let coordinator = DetailCoordinator(
            navigationController: navigationController,
            component: component
        )
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    private func dismissDetailViewController() {
        
    }
}

extension AppCoordinator: SearchCoordinatorDelegate {
    func selectWord(_ word: Word) {
        presentDetailViewController(of: word)
    }
}

extension AppCoordinator: DetailCoordinatorDelegate {}
