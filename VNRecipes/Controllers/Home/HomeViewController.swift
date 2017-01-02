//
//  HomeViewController.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 12/29/16.
//  Copyright © 2016 Hung Thai. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    override func initUI() {
        super.initUI()
        guard let item = tabBarController?.tabBar.items?[0] else {
            return
        }
        title = item.title
        
    }

}
