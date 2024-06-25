//
//  PokemonRepositoryProtocol.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 24/08/23.
//

import Foundation

protocol PokemonRepositoryProtocol{
    func getPokemons(offset: Int, limit: Int) async throws -> [PokemonEntryModel]
    func getPokemonDetail(url: String) async throws -> PokemonModel
}
