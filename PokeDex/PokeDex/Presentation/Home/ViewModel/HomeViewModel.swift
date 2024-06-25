//
//  HomeViewModel.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 24/08/23.
//

import Foundation

@MainActor class HomeViewModel: ObservableObject {
    let getPokemonsUseCase: GetPokemonsUseCase

    @Published var pokemons: [PokemonEntryModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    init(getPokemonsUseCase: GetPokemonsUseCase){
        self.getPokemonsUseCase = getPokemonsUseCase
    }
    
    func getPokemons(offset: Int, limit: Int) async throws {
        isLoading = true
        let result = try await getPokemonsUseCase.execute(offset: offset, limit: limit)
        switch result {
            case .success(let pokemons):
                self.pokemons = pokemons
                self.isLoading = false
            case .failure(let failure):
                self.isLoading = false
                self.errorMessage = failure.localizedDescription
        }
        
    }
}
