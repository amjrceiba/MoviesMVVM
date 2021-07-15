//
//  ContentView.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 12/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MoviesView()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
