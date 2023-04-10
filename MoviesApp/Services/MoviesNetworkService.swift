//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Mereke on 06.04.2023.
//

import Foundation
import Alamofire

class MoviesNetworkService {

    private let API_KEY = "e516e695b99f3043f08979ed2241b3db"

    static var shared = MoviesNetworkService()

    private var baseUrl: String = {
        return "https://api.themoviedb.org"
    }()

    private let session: Session

    private init() {
        session = Session()
    }

    func loadTodayMovies(completion: @escaping ([Movie]) -> Void) {
        loadMovies(path: "/3/movie/now_playing", completion: completion)
    }

    func loadSoonMovies(completion: @escaping ([Movie]) -> Void) {
        loadMovies(path: "/3/movie/upcoming", completion: completion)
    }

    func loadTrendingMovies(completion: @escaping ([Movie]) -> Void) {
        loadMovies(path: "/3/movie/top_rated", completion: completion)
    }

    func loadGenres(completion: @escaping ([Genre]) -> Void) {
        let url = baseUrl + "/3/genre/movie/list"

        let parameters: Parameters = ["api_key": API_KEY]

        session.request(url, method: .get, parameters: parameters).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let genresEntity = try JSONDecoder().decode(GenresEntity.self, from: data)
                    completion(genresEntity.genres)
                } catch {
                    completion([])
                }

            case .failure(let error):
                print("Error: \(error)")
                completion([])
            }
        }
    }

    private func loadMovies(path: String, completion: @escaping ([Movie]) -> Void) {
        let url = baseUrl + path

        let parameters: Parameters = [ "api_key": API_KEY ]

        session.request(url, method: .get, parameters: parameters).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let moviesEntity = try JSONDecoder().decode(MoviesEntity.self, from: data)
                    completion(moviesEntity.results)
                } catch {
                    completion([])
                }

            case .failure(let error):
                print("Error: \(error)")
                completion([])
            }
        }
    }
}
