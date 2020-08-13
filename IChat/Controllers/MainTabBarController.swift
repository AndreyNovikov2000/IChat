//
//  MainTabBarController.swift
//  IChat
//
//  Created by Andrey Novikov on 8/12/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit


class MainTabBarController: UITabBarController {
    
    // MARK: - Live cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupControllers()
    }
    
    
    // MARK: - Private methods
    
    private func setupControllers() {
        let listViewCintroller = ListViewController()
        let peopleViewController = PeopleViewController()
        
        let imageConfiguration = UIImage.SymbolConfiguration(weight: .medium)
        let messageImage = UIImage(systemName: "message", withConfiguration: imageConfiguration)
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: imageConfiguration)
        
        tabBar.tintColor = #colorLiteral(red: 0, green: 0.7903080583, blue: 0.9688076377, alpha: 1)
        tabBar.isTranslucent = false
        
        viewControllers = [
            setupNavigation(withRootViewController: listViewCintroller, title: "Messages", image: messageImage),
            setupNavigation(withRootViewController: peopleViewController, title: "People", image: peopleImage)
        ]
    }
    
    private func setupNavigation(withRootViewController rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        navigationViewController.tabBarItem.title = title
        navigationViewController.tabBarItem.image = image
        return navigationViewController
    }
}
