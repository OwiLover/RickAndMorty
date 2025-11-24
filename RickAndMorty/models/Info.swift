//
//  Info.swift
//  RickAndMorty
//
//  Created by Owi Lover on 11/24/25.
//

struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
