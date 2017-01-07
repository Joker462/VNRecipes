//
//  HomeViewControllerLayout.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/8/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit

class HomeViewControllerLayout: UICollectionViewFlowLayout {

    
    override init() {
        super.init()
        minimumLineSpacing = 2
        minimumInteritemSpacing = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
