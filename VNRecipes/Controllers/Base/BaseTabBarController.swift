//
//  BaseTabBarController.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/2/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.unselectedItemTintColor = UIColor(hex: ColorApp.tabBarIconUnselect)
        tabBar.tintColor = UIColor(hex: ColorApp.tabBarIconSeleted)
        tabBar.barTintColor = UIColor(hex: ColorApp.tabBarBackground, alpha: 0.7)
        
    }

}
