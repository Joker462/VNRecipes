//
//  MainContainerTabBarController.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/2/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit

class MainContainerTabBarController: BaseTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.once(token: "topBorderTabBar") { () in
            print("Created top border for tab bar")
            tabBar.addBorder(borderType: .Top)
        }
    }
}

private extension MainContainerTabBarController {
    func initUI() {
        
        guard let tabBarItems = tabBar.items else { return }
        // Set image and title for tab bar item
        for i in 0..<tabBarItems.count {
            tabBarItems[i].title = StaticData.sharedInstance.getTabBarData()[i].name
            tabBarItems[i].image = UIImage(named: StaticData.sharedInstance.getTabBarData()[i].imageNamed)
        }
    }
}
