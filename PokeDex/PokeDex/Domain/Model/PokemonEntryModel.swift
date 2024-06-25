//
//  PokemonEntryModel.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 24/08/23.
//

import Foundation

struct PokemonEntryModel: Hashable {
    var id: UUID = .init()
    let name: String
    let url: String
    
    var imageUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(url.split(separator: "/").last ?? "1").png"
        
    }
}
