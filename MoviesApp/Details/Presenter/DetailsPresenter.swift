//
//  DetailsPresenter.swift
//  MoviesApp
//
//  Created by Mereke on 09.04.2023.
//

import Foundation

final class DetailsPresenter: DetailsViewOutput, DetailsInteractorOutput, DetailsModuleInput  {
    weak var view: DetailsViewInput!
    var router: DetailsRouterInput!
    var interactor: DetailsInteractorInput!
    private var movieId: Int!

    func configure(with movieId: Int) {
        self.movieId = movieId
    }

    func didLoadView() {
        interactor.obtainDetails(with: movieId)
        interactor.obtainCasts(with: movieId)
    }

    func didLoadDetails(_ details: [DetailsEntity]) {
        view.handObtainedDetails(details)
    }

    func didLoadCasts(_ casts: [Cast]) {
        view.handObtainedCasts(casts)
    }

    func didSelectCell(with actorId: Int) {
        router.openActorModule(with: actorId)
    }
}
