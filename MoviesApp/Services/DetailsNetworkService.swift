//
//  DetailsNetworkService.swift
//  MoviesApp
//
//  Created by Mereke on 07.04.2023.
//

import Foundation
import Alamofire

class DetailsNetworkService {
    
    private let API_KEY = "e516e695b99f3043f08979ed2241b3db"
    
    static let shared = DetailsNetworkService()
    
    private var baseUrl: String = {
        return "https://api.themoviedb.org"
    }()
    
    private let session: Session
    
    private init() {
        session = Session()
    }
    
    func loadMovieDetails(with id: Int, completion: (([DetailsEntity]) -> (Void))?) {
        let url = baseUrl + "/3/movie/\(id)"
        let parameters: Parameters = ["api_key": API_KEY]

        session.request(url, method: .get, parameters: parameters).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let detailsEntity = try JSONDecoder().decode(DetailsEntity.self, from: data)
                    DispatchQueue.main.async {
                        completion?([detailsEntity])
                    }
                } catch let error {
                    print("Unable to parse JSON: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func loadCasts(with id: Int, completion: (([Cast]) -> (Void))?) {
        let url = baseUrl + "/3/movie/\(id)/credits"
        let parameters: Parameters = ["api_key": API_KEY]

        session.request(url, method: .get, parameters: parameters).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let castsEntity = try JSONDecoder().decode(CastsEntity.self, from: data)
                    DispatchQueue.main.async {
                        completion?(castsEntity.cast)
                    }
                } catch let error {
                    print("Unable to parse JSON: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func loadActor(with id: Int, completion: ((Actor) -> (Void))?) {
        let url = baseUrl + "/3/person/\(id)"
        let parameters: Parameters = ["api_key": API_KEY]

        session.request(url, method: .get, parameters: parameters).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let actor = try JSONDecoder().decode(Actor.self, from: data)
                    DispatchQueue.main.async {
                        completion?(actor)
                    }
                } catch let error {
                    print("Unable to parse JSON: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
