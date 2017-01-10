//
//  RecipeDetailImageCell.swift
//  VNRecipes
//
//  Created by Hung Thai on 1/10/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeDetailImageCell: BaseTableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configureCell<T>(anyItem: T) {
        guard let image = anyItem as? DetailRecipeImage else {
            return
        }
        let thumbImage = URL(string: image.url)
        pictureImageView.sd_setImage(with: thumbImage)
    }
    
}
