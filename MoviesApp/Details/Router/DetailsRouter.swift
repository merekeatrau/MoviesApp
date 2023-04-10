//
//  DetailsRouter.swift
//  MoviesApp
//
//  Created by Mereke on 09.04.2023.
//

import Foundation
import UIKit

protocol DetailsRouterInput {
    func openMovieModule(with movieId: Int)
}

final class DetailsRouter: DetailsRouterInput {
    weak var viewController: UIViewController?

    func openMovieModule(with movieId: Int) {
        let detailsVC = DetailsModuleAssembly().assemble { (detailsInput: DetailsModuleInput) in
            detailsInput.configure(with: movieId)
        }
        viewController?.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

