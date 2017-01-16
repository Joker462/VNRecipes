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
    dynamic var heightImage: String = ""
    dynamic var widthImage: String = ""
    dynamic var content: String = ""
    var detailImages: List<DetailRecipeImage>?
    var ingredients: List<Ingredient>?
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    
    // MARK: Mapping
    func mapping(map: Map) {
        name            <- map["name"]
        imageNamed      <- map["imageURL"]
        heightImage     <- map["heightImage"]
        widthImage      <- map["widthImage"]
        content         <- map["content"]
        detailImages    <- (map["linkURLs"], Transform<DetailRecipeImage>())
        ingredients     <- (map["ingredients"], Transform<Ingredient>())
    }
    
    
    func heightForText(_ font: UIFont, width: CGFloat) -> CGFloat {
        let rect = NSString(string: name).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return ceil(rect.height)
    }
}

public struct Transform<T: RealmSwift.Object>: TransformType where T: Mappable {
    
    public init() { }
    
    public typealias Object = List<T>
    public typealias JSON = Array<Any>
    
    public func transformFromJSON(_ value: Any?) -> List<T>? {
        if let objects = Mapper<T>().mapArray(JSONObject: value) {
            let list = List<T>()
            list.append(objectsIn: objects)
            return list
        }
        return nil
    }
    
    public func transformToJSON(_ value: Object?) -> JSON? {
        return value?.flatMap { $0.toJSON() }
    }
    
}
