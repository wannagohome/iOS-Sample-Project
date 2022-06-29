//
//  DomainComponent.swift
//  Domain
//
//  Created by Jinho Jang on 2022/06/23.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import Foundation
import NeedleFoundation

public protocol DomainDependency: Dependency {
    
}

public protocol DomainBuilder {
    
}

public final class DomainComponent: Component<DomainDependency>, DomainBuilder {
    
}
