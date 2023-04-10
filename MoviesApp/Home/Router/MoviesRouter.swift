//
//  MoviesRouter.swift
//  MoviesApp
//
//  Created by Mereke on 06.04.2023.
//

import Foundation
import UIKit

protocol MoviesRouterInput {
    func openMovieModule(with movieId: Int)
}

final class MoviesRouter: MoviesRouterInput {

    weak var viewController: UIViewController?

    func openMovieModule(with movieId: Int) {
        let detailsVC = DetailsModuleAssembly().assemble { presenter in
            presenter.configure(with: movieId)
        }
        viewController?.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

