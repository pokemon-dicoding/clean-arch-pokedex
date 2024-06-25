//
//  GetAllPokemon.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 24/08/23.
//

import Foundation

protocol GetPokemonsUseCase {
    func execute(offset: Int, limit: Int) async throws -> Result<[PokemonEntryModel], Error>
}

struct GetPokemonsUseImpl: GetPokemonsUseCase{
     let repo: PokemonRepositoryProtocol
    
    func execute(offset: Int, limit: Int) async throws -> Result<[PokemonEntryModel], Error> {
        do {
            let pokemons = try await repo.getPokemons(offset: offset, limit: limit)
            return .success(pokemons)
        } catch {
            return .failure(error)
        }
    }
}

