//
//  SearchViewModel.swift
//  UserInterface
//
//  Created by Jinho Jang on 2022/06/22.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import Foundation
import ReactorKit

import SearchDataRepository
import SearchDomain

final class SearchReactor: Reactor {
    
    private var repository: SearchRepositoryType
    public var initialState: State
    
    init(repository: SearchRepositoryType) {
        self.repository = repository
        initialState = State()
    }
    
    public enum Action {
        case search(String)
        case selectWord(Int)
    }
    
    public enum Mutation {
        case setWords([Word])
    }
    
    public struct State {
        var words: [Word] = []
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .search(let query):
            return repository.load(query)
                .asObservable()
                .map { $0.map { $0.asModel() } }
                .map(Mutation.setWords)
            
        case .selectWord:
            return .empty()
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .setWords(let res):
            newState.words = res
        }
        
        return newState
    }
}
