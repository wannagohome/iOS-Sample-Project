//
//  RootComponent.swift
//  Application
//
//  Created by Jinho Jang on 2022/06/22.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import Foundation
import NeedleFoundation

import Search
import UIKit
import Detail

final class RootComponent: BootstrapComponent {
    
    var searchComponent: SearchBuilder {
        shared { SearchComponent(parent: self) }
    }
    
    var detailComponent: DetailBuilder {
        shared { DetailComponent(parent: self) }
    }
    
    var navigationController: UINavigationController {
        shared { UINavigationController() }
    }
}
