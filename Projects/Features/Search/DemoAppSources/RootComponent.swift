//
//  RootComponent.swift
//  SearchDemoApp
//
//  Created by Jinho Jang on 2022/07/01.
//  Copyright © 2022 org.wannagohome. All rights reserved.
//

import UIKit
import NeedleFoundation

import Search

final class RootComponent: BootstrapComponent {
    
    var searchComponent: SearchBuilder {
        shared { SearchComponent(parent: self) }
    }
    
    var navigationController: UINavigationController {
        shared { UINavigationController() }
    }
}
