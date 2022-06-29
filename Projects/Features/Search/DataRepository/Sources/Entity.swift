//
//  Entity.swift
//  SearchDataRepository
//
//  Created by Jinho Jang on 2022/06/29.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import Foundation

import SearchDomain

// MARK: - SearchElement
public struct SearchResultElement: Codable {
    let word: String
    let phonetics: [Phonetic]
    let meanings: [Meaning]
    let license: License
    let sourceUrls: [String]
    
    public func asModel() -> Word {
        Word(
            word: word,
            meanings: meanings.map { $0.asModel() }
        )
    }
}

// MARK: - License
struct License: Codable {
    let name: String
    let url: String
}

// MARK: - Meaning
struct Meaning: Codable {
    let partOfSpeech: String
    let definitions: [Definition]
    let synonyms, antonyms: [String]
    
    func asModel() -> WordMeaning {
        WordMeaning(
            partOfSpeech: partOfSpeech,
            definitions: definitions.map { $0.asModel() }
        )
    }
}

// MARK: - Definition
struct Definition: Codable {
    let definition: String
    let synonyms, antonyms: [String]
    let example: String?
    
    func asModel() -> WordDefinition {
        WordDefinition(definition: definition)
    }
}

// MARK: - Phonetic
struct Phonetic: Codable {
    let audio: String
    let sourceURL: String?
    let license: License?
    let text: String?

    enum CodingKeys: String, CodingKey {
        case audio
        case sourceURL = "sourceUrl"
        case license, text
    }
}
