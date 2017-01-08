//
//  RecipeCell.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/7/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeCell: BaseCollectionViewCell {
    
    // IBOutlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoHeightConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func configureCell<T>(anyItem: T) {
        contentView.layer.cornerRadius = 5
        
        guard let recipe = anyItem as? Recipe else {
            return
        }
        titleLabel.text = recipe.name
        
        let thumbURL = URL(string: recipe.imageNamed)
        photoImageView.sd_setImage(with: thumbURL)
        
    }
    
    /*  This code calls the super implementation to make sure that the standard attributes are applied. Then, it casts the attributes object into an instance of PinterestLayoutAttributes to obtain the photo height and then changes the image view height by setting the imageViewHeightLayoutConstraint constant value.
     */
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let attributes = layoutAttributes as? PinterestLayoutAttributes {
            photoHeightConstraint.constant = attributes.photoHeight
        }
    }
    
}
