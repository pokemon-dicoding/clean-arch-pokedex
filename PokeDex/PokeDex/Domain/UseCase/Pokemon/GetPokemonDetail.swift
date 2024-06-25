//
//  GetPokemonDetail.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 24/08/23.
//

import Foundation

protocol GetPokemonDetailUseCase {
    func execute(url: String) async throws -> Result<PokemonModel, Error>
}

struct GetPokemonDetailImpl: GetPokemonDetailUseCase{
    let repo: PokemonRepositoryProtocol
    
    func execute(url: String) async throws -> Result<PokemonModel, Error> {
        do {
            let pokemon = try await repo.getPokemonDetail(url: url)
            return .success(pokemon)
        } catch {
            return .failure(error)
        }
    }
}

