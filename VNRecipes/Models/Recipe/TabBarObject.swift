//
//  TabBarObject.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/2/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import Foundation
class TabBarObject: BaseObject {
    
    // Properties
    var name: String
    var imageNamed: String
    
    // Initialization Methods
    init(name: String, imageNamed: String) {
       
        self.name = name
        self.imageNamed = imageNamed
        super.init()
    }
    
    override init() {
     
        self.name = ""
        self.imageNamed = ""
        super.init()
    }
}
    
