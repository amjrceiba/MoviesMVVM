//
//  MovieDetailView.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 12/07/21.
//

import SwiftUI
import Kingfisher
struct MovieDetailView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject private var movieDetailViewModel: MovieDetailViewModel
    private var url: String?
    
    init(movieDetailViewModel: MovieDetailViewModel) {
        self.movieDetailViewModel = movieDetailViewModel
        url = "\(Networking().preferences?.baseUrlImage ?? "")\(movieDetailViewModel.movie.posterPath)"
    }
    
    var body: some View {
        VStack(spacing: 10){
            ImageView(urlString: url ?? "", minHeight: 300, maxHeight: 300, cornerRadius: 0)
            
            VStack(alignment: .leading) {
                TitleContentView(title: "Overview", content: movieDetailViewModel.movie.overview)
                
                TitleContentView(title: "Popularity", content: "\(movieDetailViewModel.movie.popularity)")
                
            }
            .padding(5)
            
            Spacer()
        }
        .navigationTitle(movieDetailViewModel.movie.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    self.movieDetailViewModel.addOrRemoveMovie()
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: movieDetailViewModel.added ? "trash" : "plus")
                }
            }
        }
        .onAppear{
            self.movieDetailViewModel.checkIfMovieIsAdded()
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieDetailViewModel: MovieDetailViewModel(movie: Movie.fakeMovie()))
    }
}
