//
//  MovieDetailViewModel.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 12/07/21.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    @Published var added = false
    let movie: Movie
    let cart = Cart()
    
    init(movie: Movie) {
        self.movie = movie
        checkIfMovieIsAdded()
    }
    
    func checkIfMovieIsAdded(){
        do{
            added = try cart.checkForMovie(movie: movie)
        }
        catch{
            added = false
        }
    }
    
    func addOrRemoveMovie(){
        if added{
            try! cart.deleteMovie(movie: movie)
        }else{
            try! cart.addMovie(movie: movie)
        }
    }
}
