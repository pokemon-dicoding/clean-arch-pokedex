//
//  CustomError+Ext.swift
//  PokeDex
//
//  Created by Wahyu Alfandi on 16/08/23.
//

import Foundation

enum URLError: LocalizedError {
  
  case invalidResponse
  case addressUnreachable(URL)
  case invalidURL
  case parsingError
  
  var errorDescription: String? {
    switch self {
      case .invalidResponse: return "The server responded with garbage."
      case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
      case .invalidURL: return "The provided URL is not in a valid format."
      case .parsingError: return "The data could not be parsed due to an invalid format."
    }
  }
  
}

