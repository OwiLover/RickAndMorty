//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by Owi Lover on 11/24/25.
//
//
//import Foundation
//
//class CharacterService {
//    
//    private let baseURL: URL? = {
//        var url = URLComponents()
//        url.host = Constants.baseURL
//        url.path = Constants.charactersEndpoint
//        return url.url
//    }()
//    
//    func fetchCharactersFirstPage() async throws -> CharacterResponse {
//        guard let baseURL else {
//            return CharacterResponse(info: nil, results: nil)
//        }
//        let helper = NetworkHelper()
//        let response: CharacterResponse = try await helper.getRequest(url: baseURL)
//        return response
//    }
//    
//    func
//}
