//
//  SceneDelegate.swift
//  CrocodileGame
//
//  Created by Sergey on 16.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationVC = UINavigationController()
        let mainVC = StartViewController()
        navigationVC.viewControllers = [mainVC]
        window?.rootViewController = navigationVC
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
    }
}

