//
//  Actor.swift
//  MoviesApp
//
//  Created by Mereke on 10.04.2023.
//

import Foundation

struct Actor: Decodable {
    enum CodingKeys: String, CodingKey {
        case profileURL = "profile_path"
        case id
        case birthday
        case knownForDepartment = "known_for_department"
        case biography
        case name
    }

    let profileURL: String?
    let id: Int
    let birthday: String
    let knownForDepartment: String?
    let biography: String?
    let name: String

    var profilePath: URL? {
        guard let path = profileURL else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
}
