//
//  Details.swift
//  MoviesApp
//
//  Created by Mereke on 07.04.2023.
//

import Foundation

struct DetailsEntity: Decodable {
    enum CodingKeys: String, CodingKey {
        case overview
        case backdropURL = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case title
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }

    let overview: String
    let backdropURL: String
    let id: Int
    let originalTitle: String
    let title: String
    let releaseDate: String
    let voteAverage: Double

    var posterURL: URL? {
        let path = backdropURL
        return URL(string: "https://image.tmdb.org/t/p/w200\(backdropURL)")
    }

}
