//
//  SceneDelegate.swift
//  IChat
//
//  Created by Andrey Novikov on 8/11/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
//        window?.rootViewController = MainTabBarController()
        window?.rootViewController = AuthViewController()
        window?.makeKeyAndVisible()
    }
}

