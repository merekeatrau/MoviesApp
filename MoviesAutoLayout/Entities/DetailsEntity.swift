//
//  DetailsEntity.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 02.02.2023.
//

import Foundation

struct DetailsEntity: Decodable {
    let overview: String
    let backdropPath: String
    let id: Int
    let originalTitle: String
    let title: String
    let releaseDate: String
    let voteAverage: Double
}

struct Cast: Decodable {
    let originalName: String?
    let profilePath: String?
    let id: Int
    let character: String?
}

struct CastEntity: Decodable {
    let cast: [Cast]
}

struct Actor: Decodable {
    let profilePath: String?
    let id: Int
    let birthday: String
    let knownForDepartment: String?
    let biography: String?
    let name: String
}



