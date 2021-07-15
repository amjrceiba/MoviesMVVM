//
//  MovieListItem.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 12/07/21.
//

import SwiftUI
import Kingfisher

struct MovieListItem: View {
    private let movie: Movie
    private var url: URL?
    
    init(movie: Movie) {
        self.movie = movie
        url = URL(string: "\(Networking().preferences?.baseUrlImage ?? "")\(movie.posterPath)")
    }
    
    var body: some View {
        HStack{
            KFImage(url)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading){
                Text(movie.title)
                    .bold()
                Text("\(movie.popularity)")
                    .font(.caption)
                Spacer()
            }
            Spacer()
        }
    }
}

struct MovieListItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieListItem(movie: Movie.fakeMovie())
    }
}
