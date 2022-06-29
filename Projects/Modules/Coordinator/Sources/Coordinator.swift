//
//  Coordinator.swift
//  Sample
//
//  Created by Jinho Jang on 2022/06/28.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

public protocol Coordinator: AnyObject {
    var childCoordinators : [Coordinator] { get set }
    func start()
}
