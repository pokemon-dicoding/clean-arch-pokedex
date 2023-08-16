//
//  Pokemon.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 16/08/23.
//

import Foundation


struct Pokemon: Decodable {
    let id: String
    let name: String
    let imageUrl: String
    let type: String
    let moves: [String]
    let abilities: [String]
}

