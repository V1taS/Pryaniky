//
//  SceneDelegate.swift
//  Pryaniky
//
//  Created by Vitalii Sosin on 04.02.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.overrideUserInterfaceStyle = .light
            window.rootViewController = ListTableViewController()
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

