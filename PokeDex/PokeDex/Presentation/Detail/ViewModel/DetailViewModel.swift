
//
//  HomeViewModel.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 24/08/23.
//

import Foundation

@MainActor class DetailViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    

}
