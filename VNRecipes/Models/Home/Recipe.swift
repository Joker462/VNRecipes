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

    convenience required init?(map: Map) {
        self.init()
    }
    
    
    // MARK: Mapping
    func mapping(map: Map) {
        name       <- map["name"]
        imageNamed <- map["imageURL"]
    }
}
