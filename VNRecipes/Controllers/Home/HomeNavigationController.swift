//
//  HomeNavigationController.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/2/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit
import ZoomTransitioning

class HomeNavigationController: BaseNavigationController {

    private let zoomNavigationControllerDelegate = ZoomNavigationControllerDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        delegate = zoomNavigationControllerDelegate
    }
    
}
