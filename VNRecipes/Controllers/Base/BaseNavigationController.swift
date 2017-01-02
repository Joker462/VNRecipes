//
//  BaseNavigationController.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/2/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barTintColor = UIColor(hex: ColorApp.tabBarBackground, alpha: 0.7)
        navigationBar.tintColor = UIColor(hex: ColorApp.navigationBarIcon)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(hex: ColorApp.navigationBarTitle)]
    }

}
