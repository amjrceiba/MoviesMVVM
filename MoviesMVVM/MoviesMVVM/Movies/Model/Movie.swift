//
//  Movie.swift
//  MoviesMVVM
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 12/07/21.
//

import Foundation

public struct Movie: Codable {
    let adult: Bool
    let backdropPath: String?
    let id: Int
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, title: String
    let releaseDate:String?
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    static func fakeMovie() -> Movie {
        return Movie(adult: false, backdropPath: "/yizL4cEKsVvl17Wc1mGEIrQtM2F.jpg", id: 0, originalTitle: "test", overview: "test", popularity: 10, posterPath: "/xipF6XqfSYV8DxLqfLN6aWlwuRp.jpg", title: "test", releaseDate: "2021-06-30", video: false, voteAverage: 8.3, voteCount: 2000)
    }
}
