//
//  MoviesEntity.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 01.02.2023.
//

import Foundation

struct Movie: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case genreIds = "genre_ids"
    }
    
    let id: Int
    let originalTitle: String?
    let releaseDate: String?
    let voteAverage: Double
    let posterPath: String?
    let genreIds: [Int]
}

struct MoviesEntity: Decodable {
    let results: [Movie]
}

struct Content {
    let headerTitle: String
    var movies: [Movie]
}
