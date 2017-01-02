//
//  BaseObject.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/2/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import Foundation
class BaseObject {
    
    private let iD: String
    
    // Initialization methods
    
    init(iD: String) {
        self.iD = iD
    }
    
    init() {
        self.iD = ""
    }
    
    // Action methods
    
    func getID() -> String {
        return self.iD
    }
    
}
