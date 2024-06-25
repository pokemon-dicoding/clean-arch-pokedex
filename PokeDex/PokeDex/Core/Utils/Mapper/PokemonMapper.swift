//
//  PokemonMapper.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 21/08/23.
//

import Foundation


enum PokemonMapper {
    static func mapPokemonsResponseToDomain(input response: [PokemonEntryResponse]) -> [PokemonEntryModel] {
        return response.map { result in
            return PokemonEntryModel(
                name: result.name ?? "Unknown",
                url: result.url ?? "Unknown"
            )
        }
    }
    
    static func mapPokemonDetailResponseToDomain(input response: PokemonDetailResponse) -> PokemonModel {
        return PokemonModel(
            id: response.id ?? 0,
            name: response.name ?? "Unknown",
            type: response.types?.types?.map{ $0.name ?? "Unknown" } ?? [],
            moves: response.moves?.moves?.map{ $0.name ?? "Unknown" } ?? [],
            abilities: response.abilities?.abilities?.map{$0.name ?? "Unknown"} ?? []
        )
    }
}
