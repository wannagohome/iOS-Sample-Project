//
//  Word.swift
//  Domain
//
//  Created by Jinho Jang on 2022/06/25.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import Foundation

public struct Word {
    public let word: String
    public let meanings: [WordMeaning]
    
    public init(
        word: String,
        meanings: [WordMeaning]
    ) {
        self.word = word
        self.meanings = meanings
    }
}

public struct WordMeaning {
    public let partOfSpeech: String
    public let definitions: [WordDefinition]
    
    public init(
        partOfSpeech: String,
        definitions: [WordDefinition]
    ) {
        self.partOfSpeech = partOfSpeech
        self.definitions = definitions
    }
}

public struct WordDefinition {
    public let definition: String
    
    public init(
        definition: String
    ) {
        self.definition = definition
    }
}
