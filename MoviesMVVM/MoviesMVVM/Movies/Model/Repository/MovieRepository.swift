//
//  MovieRepository.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 12/07/21.
//

import Foundation

protocol MovieRepositoryProtocol {
    func getAllMovies(completion: @escaping([Movie])->Void)
}

class MovieRepository: MovieRepositoryProtocol {
    
    private let apiService: MovieApiServiceProtocol
    
    init(apiService: MovieApiServiceProtocol = MovieApiService()) {
        self.apiService = apiService
    }
    
    func getAllMovies(completion: @escaping([Movie]) -> Void) {
        apiService.fetchMovies { movies in
            completion(movies)
        }
    }

}
