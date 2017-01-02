//
//  Constants.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 12/29/16.
//  Copyright © 2016 Hung Thai. All rights reserved.
//

import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate

// get ratio screen
struct RATIO {
    static let SCREEN_WIDTH               = (DeviceType.IPHONE_4_OR_LESS ? 1.0 : Screen.WIDTH / 375.0)
    static let SCREEN_HEIGHT              = (DeviceType.IPHONE_4_OR_LESS ? 1.0 : Screen.HEIGHT / 667.0)
    static let SCREEN                     = ((RATIO.SCREEN_WIDTH + RATIO.SCREEN_HEIGHT) / 2.0)
}

// get scale screen
struct ScaleValue {
    static let SCREEN_WIDTH         = (DeviceType.IPAD ? 1.8 : (DeviceType.IPHONE_6 ? 1.174 : (DeviceType.IPHONE_6P ? 1.295 : 1.0)))
    static let SCREEN_HEIGHT        = (DeviceType.IPAD ? 2.4 : (DeviceType.IPHONE_6 ? 1.171 : (DeviceType.IPHONE_6P ? 1.293 : 1.0)))
    static let FONT                 = (DeviceType.IPAD ? 1.0 : (DeviceType.IPHONE_6P ? 1.27 : (DeviceType.IPHONE_6 ? 1.15 : 1.0)))
}

// get screen size
struct Screen {
    static let BOUNDS   = UIScreen.main.bounds
    static let WIDTH    = UIScreen.main.bounds.size.width
    static let HEIGHT   = UIScreen.main.bounds.size.height
    static let MAX      = max(Screen.WIDTH, Screen.HEIGHT)
    static let MIN      = min(Screen.WIDTH, Screen.HEIGHT)
}

// get device type
struct DeviceType {
    static let IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && Screen.MAX <  568.0
    static let IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && Screen.MAX == 568.0
    static let IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && Screen.MAX == 667.0
    static let IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && Screen.MAX == 736.0
    static let IPAD              = UIDevice.current.userInterfaceIdiom == .pad   && Screen.MAX == 1024.0
}

// Color
struct ColorApp {
    static let tabBarSeleted            =   "#FF9401"
    static let tabBar                   =   "#FFFFFF"
    static let tabBarBackground         =   "#1B1B1B"           // Alpha 70%
    static let backgroundController     =   "#000000"
}
