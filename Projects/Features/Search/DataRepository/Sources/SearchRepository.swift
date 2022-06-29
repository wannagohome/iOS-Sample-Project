//
//  SearchRepository.swift
//  UserInterface
//
//  Created by Jinho Jang on 2022/06/25.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import SearchDomain
import RxSwift
import Foundation

public protocol SearchRepositoryType {
    func load(_ qeary: String) -> Single<[SearchResultElement]>
}

final class SearchRepository: SearchRepositoryType {
    
    // MARK: - Properties
    private let networkManager: NetworkManagerType
    
    // MARK: - Initialization
    init(networkManager: NetworkManagerType) {
        self.networkManager = networkManager
    }
    
    // MARK: - Internal Methods
    func load(_ query: String) -> Single<[SearchResultElement]> {
        networkManager.request(SearchAPI.getAPI(query).request)
            .flatMap { data -> Single<[SearchResultElement]> in
                return .just(try JSONDecoder().decode([SearchResultElement].self, from: data))
            }
    }
}
