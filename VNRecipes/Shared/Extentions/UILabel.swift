//
//  UILabel.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 12/29/16.
//  Copyright © 2016 Hung Thai. All rights reserved.
//

import UIKit

extension UILabel {
    // scale font
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let fontName = self.font.fontName
        let fontSize = self.font.pointSize
        self.font = UIFont(name: fontName, size: fontSize * CGFloat(ScaleValue.FONT))
    }
    
    @IBInspectable var localizeKey: String {
        
        get {
            return ""
        } set {
            self.text = NSLocalizedString(newValue, comment: "")
        }
    }

}
