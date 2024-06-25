//
//  RemoteDataSources.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 16/08/23.
//

import Foundation

protocol RemoteDataSoureProtocol{
    func getPokemons(offset: Int, limit: Int) async throws -> PokemonResponse
    func getPokemonDetail(url: String) async throws -> PokemonDetailResponse
    
}

struct RemoteDataSource {
    private init() {}
    
    static let shared: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSoureProtocol{
    
    func getPokemons(offset: Int, limit: Int) async throws -> PokemonResponse {
        guard let url = URL(string: Endpoints.Gets.pokemons(offset: offset, limit: limit).url) else {throw URLError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(PokemonResponse.self, from: data)
        } catch {
            throw URLError.parsingError
        }
    }
    
    func getPokemonDetail(url: String) async throws -> PokemonDetailResponse {
        guard let url = URL(string: url) else { throw URLError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(PokemonDetailResponse.self, from: data)
        } catch {
            throw URLError.parsingError
        }
    }
}


