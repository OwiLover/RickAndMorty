//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Owi Lover on 11/24/25.
//

import SwiftUI

struct CharacterCell: View {
    let character: Character
    
    var body: some View {
        HStack {
            Text(character.name ?? "Unknown")
                .font(.headline)
            Text("Species: \(character.species ?? "Unknown")")
                .font(.subheadline)
            Text("Status: \(character.status ?? "Unknown")")
        }
    }
}
