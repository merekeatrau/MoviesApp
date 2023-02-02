//
//  DetailsNetworkManager.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 02.02.2023.
//

import Foundation

class DetailsService {
    
    private let API_KEY = "e516e695b99f3043f08979ed2241b3db"
    
    static var shared = DetailsService()
    
    private lazy var urlComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: API_KEY)
        ]
        return components
    }()
    
    private let session: URLSession
    
    private init() {
        session = URLSession(configuration: .default)
    }
    
    func loadCredits(with id: Int, completion: (([Cast]) -> (Void))?) {
        var components = urlComponents
        components.path = "/3/movie/\(id)/credits"
        
        guard let requestUrl = components.url else {
            return
        }
        
        let task = session.dataTask(with: requestUrl) { data, response , error in
            guard error == nil else {
                print("Error: error calling GET")
                return
            }
            guard let data = data else {
                print("Error: Didnt receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let castEntity = try decoder.decode(CastEntity.self, from: data)
                DispatchQueue.main.async {
                    completion?(castEntity.cast)
                }
            } catch {
                print("error")
            }
        }
        task.resume()
    }
    
    func loadMovieDetails(with id: Int, failure: ((String) -> (Void))?, completion: ((DetailsEntity) -> (Void))?) {
        var components = urlComponents
        components.path = "/3/movie/\(id)"
        
        guard let requestUrl = components.url else {
            return
        }
        
        let task = session.dataTask(with: requestUrl) { data, response , error in
            guard error == nil else {
                failure?(error?.localizedDescription ?? "Error with GET")
                return
            }
            guard let data = data else {
                failure?("Error: Didnt receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                failure?("Error: HTTP request failed")
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let detailsEntity = try decoder.decode(DetailsEntity.self, from: data)
                DispatchQueue.main.async {
                    completion?(detailsEntity)
                }
                
            } catch {
                DispatchQueue.main.async {
                    failure?("unable to parse JSON")
                }
            }
        }
        task.resume()
    }
    
    func loadActor(with id: Int, failure: ((String) -> (Void))?, completion: ((Actor) -> (Void))?) {
        var components = urlComponents
        components.path = "/3/person/\(id)"
        
        guard let requestUrl = components.url else {
            return
        }
        
        let task = session.dataTask(with: requestUrl) { data, response , error in
            guard error == nil else {
                failure?(error?.localizedDescription ?? "Error with GET 3")
                return
            }
            guard let data = data else {
                failure?("Error: Didnt receive data 3")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                failure?("Error: HTTP request failed 3")
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let actor = try decoder.decode(Actor.self, from: data)
                DispatchQueue.main.async {
                    completion?(actor)
                }
                
            } catch {
                DispatchQueue.main.async {
                    failure?("unable to parse JSON")
                }
            }
        }
        task.resume()
    }
}
