//
//  DetailsAssembly.swift
//  MoviesApp
//
//  Created by Mereke on 09.04.2023.
//

import UIKit
import Alamofire

protocol DetailsModuleInput {
    func configure(with movieId: Int)
}

typealias DetailsModuleConfiguration = (DetailsModuleInput) -> Void

final class DetailsModuleAssembly {
    func assemble(_ configuration: DetailsModuleConfiguration? = nil) -> DetailsViewController {
        let dataDisplayManager = DetailsDataDisplayManager()
        let detailsVC = DetailsViewController()
        let presenter = DetailsPresenter()
        let network = DetailsNetworkService.shared
        let interactor = DetailsInteractor(network: network)
        let router = DetailsRouter()

        configuration?(presenter)

        detailsVC.dataDisplayManager = dataDisplayManager
        detailsVC.output = presenter

        presenter.view = detailsVC
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter

        router.viewController = detailsVC

        return detailsVC
    }
}
