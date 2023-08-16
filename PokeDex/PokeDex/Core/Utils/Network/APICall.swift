//
//  APICall.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 16/08/23.
//

import Foundation

struct API {
    
    static let baseUrl = "https://pokeapi.co/api/v2/"
    
}

protocol Endpoint {
    
    var url: String { get }
    
}

enum Endpoints {
    
    enum Gets: Endpoint {
        case pokemons(limit : Int)
        case detail(id: Int)
        
        public var url: String {
            switch self {
                case .pokemons(let limit): return "\(API.baseUrl)pokemon?limit=\(limit)"
                case .detail(let id): return "\(API.baseUrl)pokemon/\(id)"
            }
        }
    }
    
}
