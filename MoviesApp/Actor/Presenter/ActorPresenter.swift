//
//  ActorPresenter.swift
//  MoviesApp
//
//  Created by Mereke on 10.04.2023.
//

import Foundation

final class ActorPresenter: ActorViewOutput, ActorInteractorOutput, ActorModuleInput {

    var interactor: ActorInteractorInput!
    var router: ActorRouter!
    weak var view: ActorViewInput?
    private var actorId: Int!

    required init(view: ActorViewInput? = nil) {
        self.view = view
    }

    func configure(with actorId: Int) {
        self.actorId = actorId
    }

    func didLoadActor(_ actor: [Actor]) {
        view?.handleObtainedActor(actor)
    }

    func didLoadView() {
        interactor.obtainActor(with: actorId)
    }
}
