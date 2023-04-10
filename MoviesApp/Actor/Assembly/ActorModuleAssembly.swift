//
//  ActorModuleAssembly.swift
//  MoviesApp
//
//  Created by Mereke on 10.04.2023.
//

import Foundation
import UIKit
import Alamofire

protocol ActorModuleInput {
    func configure(with actorId: Int)
}

typealias ActorModuleConfiguration = (ActorModuleInput) -> Void

final class ActorModuleAssembly {
    func assemble(_ configuration: ActorModuleConfiguration? = nil) -> ActorViewController {
        let dataDisplayManager = ActorDataDisplayManager()
        let actorVC = ActorViewController()
        let presenter = ActorPresenter()
        let network = DetailsNetworkService.shared
        let interactor = ActorInteractor(network: network)
        let router = ActorRouter()

        configuration?(presenter)

        actorVC.dataDisplayManager = dataDisplayManager
        actorVC.output = presenter

        presenter.view = actorVC
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter

        router.viewController = actorVC

        return actorVC
    }
}

