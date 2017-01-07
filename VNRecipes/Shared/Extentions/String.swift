//
//  String.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 12/29/16.
//  Copyright © 2016 Hung Thai. All rights reserved.
//

import Foundation

extension String {
    
    static func className(aClass: AnyClass) -> String {
        
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    var length: Int {
        return self.characters.count
    }
}
