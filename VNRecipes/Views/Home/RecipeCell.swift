//
//  RecipeCell.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/7/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit

class RecipeCell: BaseCollectionViewCell {
    
    // IBOutlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func configureCell<T>(anyItem: T) {
        contentView.layer.cornerRadius = 5
        
        guard let recipe = anyItem as? Recipe else {
            return
        }
        titleLabel.text = recipe.name
        
    }
    
}
