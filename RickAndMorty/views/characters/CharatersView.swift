//
//  CharactersView.swift
//
//  Created by Owi Lover on 11/23/25.
//

import SwiftUI

struct CharactersView: View {
    private var model: CharactersViewModel = CharactersViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(model.characters, id: \.id) { character in
                    CharacterCell(character: character)
                }
            }
//            .padding()
        }
        .task {
            do {
                let resultOne = try await model.fetchCharacters()
            }
            catch (let error) {
                print("whoops, \(error)")
            }
        }
    }
}

#Preview {
    CharactersView()
}
