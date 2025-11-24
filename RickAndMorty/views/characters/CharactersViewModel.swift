//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Owi Lover on 11/23/25.
//
import SwiftUI

@Observable class CharactersViewModel: CharactersViewModelProtocol {
    private(set) var characters: [Character]
    private let model: CharactersModelProtocol
    
    init(characters: [Character] = [], model: CharactersModelProtocol? = nil) {
        self.characters = characters
        self.model = model ?? CharactersModel()
    }
    
    func fetchCharacters() async throws {
        characters = try await model.fetchFirstCharacters()
    }
    
    func fetchNextCharacters() async throws {
        characters.append(contentsOf: try await model.fetchNextPage())
    }
}

protocol CharactersViewModelProtocol {
    var characters: [Character] { get }
    
    func fetchCharacters() async throws
    func fetchNextCharacters() async throws
}
