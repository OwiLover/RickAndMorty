//
//  CharactersModel.swift
//  RickAndMorty
//
//  Created by Owi Lover on 11/23/25.
//

import Foundation

actor CharactersModel: CharactersModelProtocol {
    private var characters: [Character] = []
    private var isFetching: Bool = false
    private var task: Task<[Character], Error>?
    private var response: CharacterResponse?
    
    func fetchFirstCharacters() async throws -> [Character] {
        
        guard !isFetching else {
            return try await task?.value ?? []
        }
        
        guard let url = URL(string: Constants.baseCharactersURL.rawValue) else {
            return []
        }
        
        task = Task {
            try await fetchCharacters(url: url)
        }
        
        return try await task?.value ?? []
    }
    
    func fetchNextPage() async throws -> [Character] {
        
        guard !isFetching else {
            return try await task?.value ?? []
        }
        
        guard let response,
              let info = response.info,
              let nextPage = info.next,
              let url = URL(string: nextPage) else {
            return []
        }
        
        task = Task {
            return try await fetchCharacters(url: url)
        }
        
        return try await task?.value ?? []
    }
    
    private func fetchCharacters(url: URL) async throws -> [Character] {
            isFetching = true
        
            let helper = await NetworkHelper()
            response = try await helper.getRequest(url: url)
        
            defer {
                isFetching = false
                task = nil
            }

        return response?.results ?? []
    }
}

protocol CharactersModelProtocol {
    func fetchNextPage() async throws -> [Character]
    func fetchFirstCharacters() async throws -> [Character]
}
