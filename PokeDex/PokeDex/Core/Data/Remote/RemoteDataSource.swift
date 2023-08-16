//
//  RemoteDataSources.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 16/08/23.
//

import Alamofire
import Combine
import Foundation


protocol RemoteDataSoureProtocol{
    func getPokemons(limit: Int) -> AnyPublisher<[PokemonResponse], Error>
    func getDetail(id: Int) -> AnyPublisher<PokemonDetailResponse, Error>
}

final class RemoteDataSource: NSObject{
    private override init() {}
    
    static let shared: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSoureProtocol{
    
    func getPokemons(limit: Int) -> AnyPublisher<[PokemonResponse], Error> {
        return Future<[PokemonResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.pokemons(limit: limit).url){
                AF.request(url)
                    .validate()
                    .responseDecodable(of: [PokemonResponse].self) { response in
                        switch response.result {
                            case .success(let value):
                                completion(.success(value))
                            case .failure:
                                completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
    func getDetail(id: Int) -> AnyPublisher<PokemonDetailResponse, Error> {
        return Future<PokemonDetailResponse, Error> { completion in
            if let url = URL(string: Endpoints.Gets.detail(id: id).url){
                AF.request(url)
                    .validate()
                    .responseDecodable(of: PokemonDetailResponse.self) { response in
                        switch response.result {
                            case .success(let value):
                                completion(.success(value))
                            case .failure:
                                completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
    
}
