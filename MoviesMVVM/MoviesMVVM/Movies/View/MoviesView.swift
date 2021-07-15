//
//  MoviesView.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 12/07/21.
//

import SwiftUI

struct MoviesView: View {
    @ObservedObject private var moviesViewModel = MoviesViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(moviesViewModel.movies, id: \.id) {movie in
                    NavigationLink(destination: MovieDetailView(movieDetailViewModel: MovieDetailViewModel(movie: movie))){
                        MovieListItem(movie: movie)
                    }
                }
            }
            .navigationTitle("Movies")
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
