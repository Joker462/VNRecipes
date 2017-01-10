//
//  UITableView.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/8/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCellNib(anyClass: AnyClass) {
        let identifier = String.className(aClass: anyClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        register(nib, forCellReuseIdentifier: identifier)
    }

    func reloadData(with animation: UITableViewRowAnimation) {
        reloadSections(IndexSet(integersIn: 0..<numberOfSections), with: animation)
    }
    
}
