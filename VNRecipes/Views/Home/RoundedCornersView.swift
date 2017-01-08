//
//  RoundedCornersView.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/8/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCornersView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

}
