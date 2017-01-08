//
//  HomeViewControllerLayout.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/8/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit

final class HomeViewControllerLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        minimumLineSpacing = 10
        minimumInteritemSpacing = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
