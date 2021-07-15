//
//  Cart.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 13/07/21.
//

import Foundation

class Cart {
    let repository: CartRepositoryProtocol
    
    init(repository: CartRepositoryProtocol = CartRepository()) {
        self.repository = repository
    }
    
    func addMovie(movie: Movie)throws {
        try repository.addMovie(movie: movie)
    }
    
    func deleteMovie(movie: Movie)throws {
        try repository.deleteMovie(movie: movie)
    }
    
    func getAllMovies()throws -> [Movie] {
        return try repository.getAllMovies()
    }
    
    func checkForMovie(movie: Movie) throws -> Bool {
        return try repository.checkForMovie(movie: movie)
    }
}
