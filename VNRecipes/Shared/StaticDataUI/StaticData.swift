//
//  StaticData.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 12/31/16.
//  Copyright © 2016 Hung Thai. All rights reserved.
//

import Foundation

class StaticData {
    
    // Singleton
    static let sharedInstance: StaticData = {
        let instance = StaticData()
        return instance
    }()
    
    // Data variables
    fileprivate var tabBarData: [TabBarObject] = []
    
    // Initialization methods
    init() {
        self.initTabBarData()
    }
    
    // Action methods
    func getTabBarData() -> [TabBarObject] {
        return tabBarData
    }
}

// MARK: Initialization private methods
private extension StaticData {
    func initTabBarData() {
        let recipesItem = TabBarObject(name: "recipes".localized, imageNamed: "recipes_icon")
        let howToItem = TabBarObject(name: "how-to".localized, imageNamed: "howto_icon")
        let searchItem = TabBarObject(name: "search".localized, imageNamed: "search_icon")
        let healthItem = TabBarObject(name: "health".localized, imageNamed: "health_icon")
        let userItem = TabBarObject(name: "account".localized, imageNamed: "account_icon")
        
        tabBarData = [recipesItem, howToItem, searchItem, healthItem, userItem]
    }
}
