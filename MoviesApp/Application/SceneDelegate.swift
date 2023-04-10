//
//  SceneDelegate.swift
//  MoviesApp
//
//  Created by Mereke on 20.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navController = UINavigationController(rootViewController: MovieModuleAssembly().assemble())
//        let navController = UINavigationController(rootViewController: DetailsViewController())
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

