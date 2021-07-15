//
//  TitleContentView.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 12/07/21.
//

import SwiftUI

struct TitleContentView: View {
    
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text(title)
                .font(.title)
                .bold()
            Text(content)
                .font(.caption2)
        }
    }
}

struct TitleContentView_Previews: PreviewProvider {
    static var previews: some View {
        TitleContentView(title: "Title", content: "asffjkahfkjahfjkadfhjakf")
    }
}
