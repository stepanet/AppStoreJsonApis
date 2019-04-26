//
//  BaseTapBarController.swift
//  AppStoreJsonApis
//
//  Created by Jack Sp@rroW on 26/04/2019.
//  Copyright © 2019 Jack Sp@rroW. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tabBar.tintColor = .red //цвет иконок в таббаре
        tabBar.barTintColor = .white //цвет таб бара
        
        viewControllers = [
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today"),
            createNavController(viewController: UIViewController(), title: "Apps", imageName: "apps"),

        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true
        
        return navController
    }
}
