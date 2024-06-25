//
//  PokemonRepository.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 21/08/23.
//
import Foundation


struct PokemonRepositoryImpl {
    typealias PokemonInstance = (RemoteDataSource) -> PokemonRepositoryImpl
    
    fileprivate let remote: RemoteDataSource
    
    private init(remote: RemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: PokemonInstance = {  remoteRepo in
        return PokemonRepositoryImpl(remote: remoteRepo)
    }
}

extension PokemonRepositoryImpl: PokemonRepositoryProtocol {
    
    func getPokemons(offset: Int, limit: Int) async throws -> [PokemonEntryModel] {
        do {
            let data = try await remote.getPokemons(offset: offset, limit: limit)
            
            return PokemonMapper.mapPokemonsResponseToDomain(input: data.results ?? [])
        } catch {
            throw error
        }
    }
    
    func getPokemonDetail(url: String) async throws -> PokemonModel {
        do {
            let data = try await remote.getPokemonDetail(url: url)
            
            return PokemonMapper.mapPokemonDetailResponseToDomain(input: data)
        } catch {
            throw error
        }
    }
}
