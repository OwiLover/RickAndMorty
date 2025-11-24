//
//  Character.swift
//  RickAndMorty
//
//  Created by Owi Lover on 11/23/25.
//

struct Character: Decodable, Hashable {
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let location: Location?
    let image: String?
    let episodes: [String?]
    let urlString: String?
    let created: String?
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case status
        case species
        case type
        case gender
        case location
        case image
        case episode
        case url
        case created
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.species = try container.decodeIfPresent(String.self, forKey: .species)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.location = try container.decodeIfPresent(Location.self, forKey: .location)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.episodes = try container.decode([String?].self, forKey: .episode)
        self.urlString = try container.decodeIfPresent(String.self, forKey: .url)
        self.created = try container.decodeIfPresent(String.self, forKey: .created)
    }
}

struct Location: Decodable, Hashable {
    let name: String?
    let urlString: String?
    
    enum CodingKeys: CodingKey {
        case name
        case url
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.urlString = try container.decodeIfPresent(String.self, forKey: .url)
    }
}
