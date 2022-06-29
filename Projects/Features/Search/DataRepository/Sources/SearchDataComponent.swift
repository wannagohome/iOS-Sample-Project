//
//  SearchDataComponent.swift
//  SearchDataRepository
//
//  Created by Jinho Jang on 2022/06/29.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import Foundation
import NeedleFoundation

public protocol SearchDataDependency: Dependency {
    
}

public protocol SearchDataBuilder {
    var repository: SearchRepositoryType { get }
}

public final class SearchDataComponent: Component<SearchDataDependency>, SearchDataBuilder {
    public var repository: SearchRepositoryType {
        SearchRepository(networkManager: NetworkManager())
    }
}
