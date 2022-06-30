//
//  DetailComponent.swift
//  Detail
//
//  Created by Jinho Jang on 2022/06/30.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import NeedleFoundation

import SearchDomain

public protocol DetailDependency: Dependency {
    
}

public protocol DetailBuilder {
    var model: Word? { get set }
}

public final class DetailComponent: Component<DetailDependency>, DetailBuilder {
    public var model: Word?
}
