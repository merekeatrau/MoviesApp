//
//  ActorInteractor.swift
//  MoviesApp
//
//  Created by Mereke on 10.04.2023.
//

import Foundation

protocol ActorInteractorInput: AnyObject {
    func obtainActor(with actorId: Int)
}

protocol ActorInteractorOutput: AnyObject {
    func didLoadActor(_ actor: [Actor])
}

final class ActorInteractor: ActorInteractorInput {

    weak var output: ActorInteractorOutput!
    private var network: DetailsNetworkService!

    required init(network: DetailsNetworkService) {
        self.network = network
    }

    func obtainActor(with actorId: Int) {
        network.loadActor(with: actorId) { [weak self] actor in
            self?.output.didLoadActor(actor)
        }
    }
}
