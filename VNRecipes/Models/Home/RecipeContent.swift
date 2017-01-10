//
//  RecipeContent.swift
//  VNRecipes
//
//  Created by Hung Thai on 1/10/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import ObjectMapper
import RealmSwift

class RecipeContent: Object, Mappable {
    dynamic var content: String = ""
//    dynamic var linkURLs: [String] = []

    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        content   <-    map["content"]
//        linkURLs  <-    map["linkURLs"]
    }
    
    
}
