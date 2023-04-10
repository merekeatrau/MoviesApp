//
//  Genre.swift
//  MoviesApp
//
//  Created by Mereke on 07.04.2023.
//

import Foundation

struct Genre: Decodable {
    let id: Int
    let name: String
}

struct GenresEntity: Decodable {
    let genres: [Genre]
}
