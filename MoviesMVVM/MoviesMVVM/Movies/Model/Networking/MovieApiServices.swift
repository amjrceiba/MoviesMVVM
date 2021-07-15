//
//  MovieApiServices.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 12/07/21.
//

import Foundation
import SwiftyJSON

protocol MovieApiServiceProtocol {
    func fetchMovies( completion: @escaping ([Movie])->Void)
}

class MovieApiService: MovieApiServiceProtocol {
    
    let networking = Networking()
    
    func fetchMovies(completion: @escaping([Movie]) -> Void) {
        let url = "\(networking.preferences?.baseUrl ?? "")\(networking.preferences?.discover ?? "")\(networking.preferences?.apiKey ?? "")"
        
        Networking().get(url: url) { response in
            if (response.error != nil){
                completion([Movie]())
            }
        
            let json = JSON(response.data!)
            let data = json["results"].array
            let movies = try! JSONDecoder().decode([Movie].self, from: JSON(data!).rawData())
            
            completion(movies)
        }
    }
}


