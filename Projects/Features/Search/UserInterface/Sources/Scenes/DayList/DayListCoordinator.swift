//
//  DayListCoordinator.swift
//  UserInterface
//
//  Created by Jinho Jang on 2022/06/29.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import Foundation
import Coordinator
import UIKit

public protocol DayListCoordinatorDelegate: AnyObject {
    
}

public final class DayListCoordinator: Coordinator {
    
    public var childCoordinators: [Coordinator] = []
    public weak var delegate: DayListCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let viewController = DayListViewController()
        navigationController.present(viewController, animated: true)
    }
}
