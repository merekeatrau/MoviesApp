//
//  MovieModuleAssembly.swift
//  MoviesApp
//
//  Created by Mereke on 06.04.2023.
//

import UIKit
import Alamofire

final class MovieModuleAssembly {

    func assemble() -> HomeViewController {
        let dataDisplayManager = MovieDataDisplayManager()
        let movieVC = HomeViewController()
        let presenter = MoviesPresenter()
        let network = MoviesNetworkService.shared
        let interactor = MoviesInteractor(network: network)
        let router = MoviesRouter()

        movieVC.dataDisplayManager = dataDisplayManager
        movieVC.output = presenter

        presenter.view = movieVC
        presenter.interactor = interactor
        presenter.router = router as! any MoviesRouterInput

        interactor.output = presenter

        router.viewController = movieVC

        return movieVC
    }
}
