//
//  PokeDexApp.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 16/08/23.
//

import SwiftUI

@main
struct PokeDexApp: App {
    
    @StateObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path){
                ContentView().navigationDestination(for: Route.self) { route in
                    switch(route){
                        case .home:
                            HomeView()
                        case .detail(let pokemon):
                            DetailView(pokemon: pokemon)
                    }
                }
            }
            .environmentObject(router)
        }
    }
}
