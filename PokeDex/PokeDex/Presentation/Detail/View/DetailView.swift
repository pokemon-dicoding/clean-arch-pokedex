//
//  DetailView.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 24/08/23.
//

import SwiftUI

struct DetailView: View {
    let pokemon: PokemonEntryModel
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 240)
            } placeholder: {
                Rectangle().fill(.ultraThinMaterial)
                    .frame(width: 240, height: 240)
            }
            Text(pokemon.name.capitalized)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(.black)
                .padding(.top, 4)
        }
    }
}

