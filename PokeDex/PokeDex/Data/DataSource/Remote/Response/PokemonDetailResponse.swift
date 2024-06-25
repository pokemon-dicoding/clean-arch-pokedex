//
//  PokemonDetailResponse.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 16/08/23.
//

import Foundation

struct PokemonDetailResponse: Decodable{
    let id: Int?
    let name: String?
    let height: Int?
    let weight: Int?
    let types: TypeResponses?
    let moves: MovesResponse?
    let abilities: AbilitiesResponse?
}

struct TypeResponses: Decodable{
    let types: [TypeResponse]?
}

struct TypeResponse: Decodable{
    let name: String?
}

struct MovesResponse: Decodable{
    let moves: [MoveResponse]?
}
struct MoveResponse: Decodable{
    let name: String?
}

struct AbilitiesResponse: Decodable{
    let abilities: [AbilityResponse]?
}

struct AbilityResponse: Decodable{
    let name: String?
}

