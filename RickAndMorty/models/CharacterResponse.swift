//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Owi Lover on 11/24/25.
//

struct CharacterResponse: Decodable {
    let info: Info?
    let results: [Character]?
}
