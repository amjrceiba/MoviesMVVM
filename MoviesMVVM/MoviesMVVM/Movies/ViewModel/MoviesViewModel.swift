//
//  MoviesViewModel.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 12/07/21.
//

import Foundation

class MoviesViewModel: ObservableObject {
    
    @Published var movies = [Movie]()
    private let repository: MovieRepositoryProtocol
    
    init(repository: MovieRepositoryProtocol = MovieRepository()) {
        self.repository = repository
        getAllMovies()
    }
    
    func getAllMovies(){
        repository.getAllMovies { movies in
            DispatchQueue.main.async {
                self.movies = movies
            }
        }
    }
}
