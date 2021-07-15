//
//  CartStorageService.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 13/07/21.
//

import Foundation
import RealmSwift

protocol CartStorageServiceProtocol {
    func addMovie(movie: Movie)throws
    func deleteMovie(movie: Movie)throws
    func getAllMovies()throws->[Movie]
    func checkForMovie(movie: Movie)throws->Bool
}

class CartStorageService: CartStorageServiceProtocol {
    func addMovie(movie: Movie)throws {
        let realm = try Realm()
        let movieEntity = MovieTraslator().modelToEntiy(movie: movie)
        try realm.write {
            realm.add(movieEntity)
        }
    }
    
    func deleteMovie(movie: Movie)throws {
        let movieEntity = MovieTraslator().modelToEntiy(movie: movie)
        let realm = try Realm()
        
        if let movieObject = realm.objects(MovieEntity.self).filter("id == \(movieEntity.id)").first{
            try! realm.write {
                realm.delete(movieObject)
            }
        }
    }
    
    func getAllMovies()throws -> [Movie] {
        var movies = [Movie]()
        
        let realm = try! Realm()
        let movieEntities = realm.objects(MovieEntity.self)
        
        movies = MovieTraslator().getMoviesModels(movieEntities: movieEntities)
        
        return movies
    }
    
    func checkForMovie(movie: Movie)throws->Bool{
        let movieEntity = MovieTraslator().modelToEntiy(movie: movie)
        let realm = try Realm()
        
        
        if realm.objects(MovieEntity.self).filter("id == \(movieEntity.id)").first != nil{
            return true
        }

        return false
    }
}
