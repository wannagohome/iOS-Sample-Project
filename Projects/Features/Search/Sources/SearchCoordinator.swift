//
//  SearchCoordinator.swift
//  Search
//
//  Created by Jinho Jang on 2022/06/29.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import Foundation
import Coordinator
import UIKit

import SearchUserInterface
import SearchDomain

public protocol SearchCoordinatorDelegate: AnyObject {
    func selectWord(_ word: Word)
}

public final class SearchCoordinator: Coordinator {
    
    public var childCoordinators: [Coordinator] = []
    public weak var delegate: SearchCoordinatorDelegate?
    
    private let navigationController: UINavigationController
    private let component: SearchBuilder
    
    public init(
        navigationController: UINavigationController,
        component: SearchBuilder
    ) {
        self.component = component
        self.navigationController = navigationController
    }
    
    public func start() {
        let viewController = component.uiComponent.searchViewController
        navigationController.viewControllers = [viewController]
    }
}

extension SearchCoordinator: SearchReactorDelegate {
    public func selectWord(_ word: Word) {
        delegate?.selectWord(word)
    }
}
