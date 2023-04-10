//
//  DetailsInteractor.swift
//  MoviesApp
//
//  Created by Mereke on 09.04.2023.
//

import Foundation

protocol DetailsInteractorInput: AnyObject {
    func obtainDetails(with movieId: Int)
    func obtainCasts(with movieId: Int)
}

protocol DetailsInteractorOutput: AnyObject {
    func didLoadDetails(_ details: [DetailsEntity])
    func didLoadCasts(_ casts: [Cast])
}

final class DetailsInteractor: DetailsInteractorInput {

    weak var output: DetailsInteractorOutput!

    private var network = DetailsNetworkService.shared

    required init(network: DetailsNetworkService) {
        self.network = network
    }

    func obtainDetails(with movieId: Int) {
        network.loadMovieDetails(with: movieId) { [weak self] details in
            self?.output.didLoadDetails(details)
        }
    }

    func obtainCasts(with movieId: Int) {
        network.loadCasts(with: movieId) { [weak self] casts in
            self?.output.didLoadCasts(casts)
        }
    }
}
