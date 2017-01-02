//
//  UIView.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/2/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit
extension UIView {
    enum Border {
        case Top
        case Bottom
        case Left
        case Right
    }
    
    
    func addBorder(borderType: Border, weightBorder: CGFloat = 1.0 ,colorBorder: UIColor = UIColor(hex: ColorApp.borderView)) {
        
        let borderLayer = CAShapeLayer()
        switch borderType {
        case .Top:
            borderLayer.path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: self.bounds.width, height: weightBorder)).cgPath
            break
        case .Bottom:
            borderLayer.path = UIBezierPath(rect: CGRect(x: 0, y: self.bounds.height - weightBorder, width: self.bounds.width, height: weightBorder)).cgPath
            break
        case .Left:
            borderLayer.path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: weightBorder, height: self.bounds.height)).cgPath
            break
        default:
            // Right
            borderLayer.path = UIBezierPath(rect: CGRect(x: self.bounds.width - weightBorder, y: 0, width: weightBorder, height: self.bounds.height)).cgPath
            break
        }
        borderLayer.fillColor = colorBorder.cgColor
        layer.addSublayer(borderLayer)
    }
}
