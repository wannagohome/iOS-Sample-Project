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

final class RootComponent: BootstrapComponent {
    
    var searchComponent: SearchBuilder {
        shared { SearchComponent(parent: self) }
    }
}
