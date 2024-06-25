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
      case pokemons(offset: Int, limit : Int)
        
        
        public var url: String {
            switch self {
                case .pokemons(let offset, let limit): return "\(API.baseUrl)pokemon?offset=\(offset)&limit=\(limit)"
            }
        }
    }
    
}
