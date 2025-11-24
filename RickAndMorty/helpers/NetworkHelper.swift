//
//  NetworkHelper.swift
//  RickAndMorty
//
//  Created by Owi Lover on 11/23/25.
//

import Foundation

enum NetworkErrors: Error {
    case invalidResponse(Int?)
}

class NetworkHelper {
    func getRequest<result: Decodable>(url: URL) async throws -> result {
        let (data, answer) = try await URLSession.shared.data(from: url)
        
        guard let answerConverted = answer as? HTTPURLResponse else {
            throw NetworkErrors.invalidResponse(nil)
        }
        
        guard (200...299).contains(answerConverted.statusCode) else {
            throw NetworkErrors.invalidResponse(answerConverted.statusCode)
        }
        
        return try JSONDecoder().decode(result.self, from: data)
    }
}
