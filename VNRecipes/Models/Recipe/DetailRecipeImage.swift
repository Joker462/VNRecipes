//
//  RecipeImage.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/10/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//


import RealmSwift
import ObjectMapper

class DetailRecipeImage: Object, Mappable {
    dynamic var url: String = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        url     <-      map["imageURL"]
    }
    
}
