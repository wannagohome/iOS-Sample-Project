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
    
    private func presentDetailViewController() {
//        let coordinator = DayListCoordinator(navigationController: navigationController)
//        coordinator.delegate = self
//        coordinator.start()
//        childCoordinators.append(coordinator)
    }
    
    private func dismissDetailViewController() {
        
    }
}

extension AppCoordinator: SearchCoordinatorDelegate {
    func selectWord() {
        presentDetailViewController()
    }
}
