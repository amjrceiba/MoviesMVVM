//
//  CartViewModel.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 13/07/21.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    @Published var movies = [Movie]()
    let cart = Cart()
    
    func loadMovies(){
        movies = try! cart.getAllMovies()
    }
    
    func deleteMovie(movie: Movie){
        try! cart.deleteMovie(movie: movie)
        loadMovies()
    }
}
