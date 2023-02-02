//
//  GenresEntity.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 31.01.2023.
//

import Foundation

struct Genre: Decodable {
    let id: Int
    let name: String
}

struct GenresEntity: Decodable {
    let genres: [Genre]
}
