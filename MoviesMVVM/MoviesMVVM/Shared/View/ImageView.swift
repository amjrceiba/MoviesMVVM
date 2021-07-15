//
//  ImageView.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 12/07/21.
//

import SwiftUI
import Nuke
import FetchImage

struct ImageView: View {
    let urlString: String
    let minHeight: CGFloat
    let maxHeight: CGFloat
    let cornerRadius: CGFloat
    
    @StateObject private var image = FetchImage()
    var body: some View {
        VStack{
            let URL = URL(string: urlString)!
            
            ZStack {
                //placeholder
                VStack {
                    ActivityIndicator(isAnimating: .constant(true), style: .medium)
                }
                
                image.view?
                    .resizable()
                    .scaledToFill()
                    .clipped()
                
            }
            .onAppear { image.load(URL) }
            .onDisappear(perform: image.reset)
            .frame(maxWidth: .infinity, minHeight: minHeight, maxHeight: maxHeight)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        }
    }
}

struct ActivityIndicator: UIViewRepresentable {
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct LoadingView<Content>: View where Content: View {
    
    @Binding var isShowing: Bool
    var content: () -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                
                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)
                
                VStack {
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .foregroundColor(Color.primary)
                .opacity(self.isShowing ? 1 : 0)
                .animation(.linear)
            }
            
        }
    }
    
}


