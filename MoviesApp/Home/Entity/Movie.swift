//
//  Movie.swift
//  MoviesApp
//
//  Created by Mereke on 02.04.2023.
//

import Foundation
import UIKit

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
    let posterURL: String?
    let genreIds: [Int]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        self.voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        if let posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) {
            self.posterURL = "https://image.tmdb.org/t/p/w200\(posterPath)"
        }
        else { posterURL = nil }
        self.genreIds = try container.decode([Int].self, forKey: .genreIds)
    }
}

struct MoviesEntity: Decodable {
    let results: [Movie]
}

struct Content {
    let headerTitle: String
    var movies: [Movie]
}
