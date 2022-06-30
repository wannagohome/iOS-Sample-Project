//
//  DetailReactor.swift
//  Detail
//
//  Created by Jinho Jang on 2022/06/30.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import ReactorKit

import SearchDomain

final class DetailReactor: Reactor {
    
    typealias Action = NoAction
    
    var initialState: State
    
    init(_ word: Word) {
        self.initialState = State(word: word)
    }
    
    struct State {
        let word: Word
    }
}
