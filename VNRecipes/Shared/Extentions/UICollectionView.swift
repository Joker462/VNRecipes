//
//  UICollectionView.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/8/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerCellNib(anyClass: AnyClass) {
        let identifier = String.className(aClass: anyClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: identifier)
    }
}
