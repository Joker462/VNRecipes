//
//  Ingredient.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/16/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import RealmSwift
import ObjectMapper

class Ingredient: Object, Mappable {
    dynamic var title: String = ""
    dynamic var unit: String = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        title   <- map["title"]
        unit    <- map["unit"]
    }
}
