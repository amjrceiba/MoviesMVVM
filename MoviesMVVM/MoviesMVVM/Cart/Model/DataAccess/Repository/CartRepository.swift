//
//  CartRepository.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 13/07/21.
//

import Foundation

protocol CartRepositoryProtocol {
    func addMovie(movie: Movie)throws
    func deleteMovie(movie: Movie)throws
    func getAllMovies()throws->[Movie]
    func checkForMovie(movie: Movie)throws->Bool
}

class CartRepository: CartRepositoryProtocol {
    
    private let storageService: CartStorageServiceProtocol
    
    init(storageService: CartStorageServiceProtocol = CartStorageService()) {
        self.storageService = storageService
    }
    
    func addMovie(movie: Movie)throws {
        try storageService.addMovie(movie: movie)
    }
    
    func deleteMovie(movie: Movie)throws {
        try storageService.deleteMovie(movie: movie)
    }
    
    func getAllMovies()throws -> [Movie] {
        return try storageService.getAllMovies()
    }
    
    func checkForMovie(movie: Movie) throws -> Bool {
        return try storageService.checkForMovie(movie: movie)
    }
    
}
