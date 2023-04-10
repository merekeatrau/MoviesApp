//
//  Cast.swift
//  MoviesApp
//
//  Created by Mereke on 07.04.2023.
//

import Foundation

struct Cast: Decodable {
    enum CodingKeys: String, CodingKey {
        case originalName = "original_name"
        case profilePath  = "profile_path"
        case id
        case character
    }

    let originalName: String?
    let profilePath: String?
    let id: Int
    let character: String?

    var profileURL: URL? {
        guard let path = profilePath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
}

struct CastsEntity: Decodable {
    let cast: [Cast]
}
