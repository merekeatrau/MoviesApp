//
//  MoviesInteractor.swift
//  MoviesApp
//
//  Created by Mereke on 06.04.2023.
//

import Foundation

protocol MoviesInteractorInput {
    func obtainMovies()
}

protocol MoviesInteractorOutput: AnyObject {
    func didLoadTrendingMovies(_ movies: [Movie])
    func didLoadTodayMovies(_ movies: [Movie])
    func didLoadSoonMovies(_ movies: [Movie])
    func didLoadGenres(_ genres: [Genre])
}

final class MoviesInteractor: MoviesInteractorInput {
    
    private var network = MoviesNetworkService.shared
    
    weak var output: MoviesInteractorOutput!
    
    required init(network: MoviesNetworkService) {
        self.network = network
    }
    
    func obtainMovies() {
        network.loadTrendingMovies { [weak self] movies in
            self?.output.didLoadTrendingMovies(movies)
        }
        network.loadTodayMovies { [weak self] movies in
            self?.output.didLoadTodayMovies(movies)
        }
        network.loadSoonMovies { [weak self] movies in
            self?.output.didLoadSoonMovies(movies)
        }
        network.loadGenres { [weak self] genres in
            self?.output.didLoadGenres(genres)
        }
    }
}
