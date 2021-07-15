//
//  CartView.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 12/07/21.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var cartViewModel = CartViewModel()
    @State private var showingAlert = false
    @State var selectedMovie: Movie?
    
    var body: some View {
        
        NavigationView{
            
            List{
                ForEach(cartViewModel.movies, id: \.id) {movie in
                    CartListItem(movie: movie) { movie in
                        selectedMovie = movie
                        showingAlert = true
                    }
                }
            }
            .navigationTitle("Cart")
            
        }
        .alert(isPresented: $showingAlert, content: {
            
            Alert(
                title: Text("Alert"),
                message: Text("Do you want to remove \(selectedMovie!.originalTitle) from your cart?"),
                primaryButton: .default(
                    Text("Yes"),
                    action: {
                        cartViewModel.deleteMovie(movie: selectedMovie!)
                    }
                ),
                secondaryButton: .cancel(
                    Text("No")
                ))
            
        })
        .onAppear{
            cartViewModel.loadMovies()
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
