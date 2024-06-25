//
//  File.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 21/08/23.
//

import Foundation


struct Injection{
    
    private init(){}
    
    static let shared: Injection = Injection()
    
    private func provideRepository() -> PokemonRepositoryProtocol {
        let remote: RemoteDataSource = RemoteDataSource.shared
        return PokemonRepositoryImpl.sharedInstance(remote)
    }
    
    func provideGetPokemonsUseCase() -> GetPokemonsUseCase {
        GetPokemonsUseImpl(repo: provideRepository())
    }
    
    func provideGetPokemonDetailUseCase() -> GetPokemonDetailUseCase {
        GetPokemonDetailImpl(repo: provideRepository())
    }
}



