//
//  DetailCoordinator.swift
//  Detail
//
//  Created by Jinho Jang on 2022/06/30.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import UIKit
import Coordinator

import SearchDomain

public protocol DetailCoordinatorDelegate: AnyObject {}

public final class DetailCoordinator: Coordinator {
    
    public var childCoordinators: [Coordinator] = []
    public weak var delegate: DetailCoordinatorDelegate?
    private let navigationController: UINavigationController
    private let component: DetailBuilder
    
    public init(
        navigationController: UINavigationController,
        component: DetailBuilder
    ) {
        self.navigationController = navigationController
        self.component = component
    }
    
    public func start() {
        navigationController.pushViewController(component.viewController, animated: true)
    }
}
