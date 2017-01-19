//
//  BaseTableViewCell.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/7/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configureCell<T>(anyItem: T) {
        
    }
}

@objc protocol TableViewCellDelegate: class {
    @objc optional func selected(indexPath: IndexPath)
}
