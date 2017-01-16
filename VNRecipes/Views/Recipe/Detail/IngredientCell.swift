//
//  IngredientCell.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/16/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit

class IngredientCell: BaseTableViewCell {

    // IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.backgroundColor = UIColor.black
        titleLabel.textColor = UIColor.white
        unitLabel.textColor = UIColor.white
    }

    override func configureCell<T>(anyItem: T) {
        guard let ingredient = anyItem as? Ingredient else {
            return
        }
        titleLabel.text = ingredient.title
        unitLabel.text = ingredient.unit
    }
    
}
