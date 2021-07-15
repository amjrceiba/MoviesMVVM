//
//  CartListItem.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 13/07/21.
//

import SwiftUI
import Kingfisher

struct CartListItem: View {
    private let movie: Movie
    private var url: URL?
    private var deleteButtonAction: (Movie)->()
    
    init(movie: Movie, deleteButtonAction: @escaping (Movie)->()) {
        self.movie = movie
        self.deleteButtonAction = deleteButtonAction
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
            
            Button(action: {
                self.deleteButtonAction(movie)
            }){
                Image(systemName: "trash")
            }
            .buttonStyle(BorderlessButtonStyle())
        }
    }
}

//struct CartListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CartListItem(movie: Movie.fakeMovie())
//    }
//}
