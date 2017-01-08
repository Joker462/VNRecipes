//
//  Recipe.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/7/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import ObjectMapper
import RealmSwift

class Recipe: Object, Mappable {
    dynamic var name: String = ""
    dynamic var imageNamed: String = ""
    dynamic var heightImage: String = ""
    dynamic var widthImage: String = ""

    convenience required init?(map: Map) {
        self.init()
    }
    
    
    // MARK: Mapping
    func mapping(map: Map) {
        name        <- map["name"]
        imageNamed  <- map["imageURL"]
        heightImage <- map["heightImage"]
        widthImage  <- map["widthImage"]
    }
    
    
    func heightForText(_ font: UIFont, width: CGFloat) -> CGFloat {
        let rect = NSString(string: name).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return ceil(rect.height)
    }
}
