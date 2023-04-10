//
//  MoviesPresenter.swift
//  MoviesApp
//
//  Created by Mereke on 06.04.2023.
//

import Foundation

final class MoviesPresenter: MoviesViewOutput, MoviesInteractorOutput {

    var interactor: MoviesInteractorInput!
    var router: MoviesRouterInput!
    weak var view: MoviesViewInput!

    func didLoadView() {
        interactor.obtainMovies()
    }

    func didLoadTrendingMovies(_ movies: [Movie]) {
        view.handleObtainedTrendingMovies(movies: movies)
    }

    func didLoadTodayMovies(_ movies: [Movie]) {
        view.handleObtainedTodayMovies(movies: movies)
    }

    func didLoadSoonMovies(_ movies: [Movie]) {
        view.handleObtainedSoonMovies(movies: movies)
    }

    func didLoadGenres(_ genres: [Genre]) {
        view.handleObtainedGenres(genres: genres)
    }

    func didSelectCell(with movieId: Int) {
        router.openMovieModule(with: movieId)
    }
}
