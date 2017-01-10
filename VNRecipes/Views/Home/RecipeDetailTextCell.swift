//
//  RecipeDetailTextCell.swift
//  VNRecipes
//
//  Created by Hung Thai on 1/10/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import UIKit

class RecipeDetailTextCell: BaseTableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentLabel.textColor = UIColor.white
        contentView.backgroundColor = UIColor.black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func configureCell<T>(anyItem: T) {
        guard let text = anyItem as? String else {
            return
        }
        
        contentLabel.text = text
    }
}
