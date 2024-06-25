//
//  Router.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 28/03/24.
//

import Foundation


import SwiftUI

enum Route: Hashable{
    case home
    case detail(pokemon: PokemonEntryModel)
}

final class Router: ObservableObject{
    @Published  var path = NavigationPath()
    
    public func toRoot(){
        path = .init()
    }
    
    public func pop(){
        path.removeLast()
    }
    
    public func push(_ route: Route){
        path.append(route)
    }
}
