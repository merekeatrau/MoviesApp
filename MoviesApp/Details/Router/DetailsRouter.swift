//
//  DetailsRouter.swift
//  MoviesApp
//
//  Created by Mereke on 09.04.2023.
//

import Foundation
import UIKit

protocol DetailsRouterInput {
    func openActorModule(with actorId: Int)
}

final class DetailsRouter: DetailsRouterInput {
    weak var viewController: UIViewController?

    func openActorModule(with actorId: Int) {
        let actorVC = ActorModuleAssembly().assemble { presenter in
            presenter.configure(with: actorId)
        }
        print(actorId)
        print(actorId)
        viewController?.navigationController?.pushViewController(actorVC, animated: true)
    }
}

