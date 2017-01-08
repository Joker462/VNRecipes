//
//  String.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 12/29/16.
//  Copyright © 2016 Hung Thai. All rights reserved.
//

import Foundation
import UIKit

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
    
    
    func convertToCGFloat() -> CGFloat {
        if let number = NumberFormatter().number(from: self) {
            return CGFloat(number)
        }
        return 0.0
    }
}
