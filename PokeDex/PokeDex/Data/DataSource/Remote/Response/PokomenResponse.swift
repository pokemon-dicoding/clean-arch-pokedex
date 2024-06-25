//
//  PokemonResponse.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 16/08/23.
//

import Foundation

struct PokemonResponse: Decodable {
    let count: Int?
    let results: [PokemonEntryResponse]?
}

struct PokemonEntryResponse: Decodable {
    let name: String?
    let url: String?
}

