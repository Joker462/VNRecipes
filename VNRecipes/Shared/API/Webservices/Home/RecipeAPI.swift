//
//  RecipeAPI.swift
//  VNRecipes
//
//  Created by Hung Thai Minh on 1/7/17.
//  Copyright © 2017 Hung Thai. All rights reserved.
//

import ObjectMapper
import Alamofire

class RecipeAPI {
    static let sharedInstance = RecipeAPI()
    
    enum RecipeStatus {
        case success ([Recipe])
        case failed  (RESTError?)
    }
    
    
    private init() {
        
    }
    
    
    
    // GET recipes
    func getRecipes(completion: @escaping (_ status: RecipeStatus)-> Void) {
        let request = RESTRequest(functionName: "/recipes", method: .get, endcoding: URLEncoding.default)
        
        request.baseInvoker { (result, error) in
            if result != nil && error == nil {
                if let recipes = Mapper<Recipe>().mapArray(JSONObject: result) {
                    completion(.success(recipes))
                }
                else {
                    completion(.success([]))
                }
            }
            else {
                completion(.failed(error))
            }
        }
    }
    
//    func getDetailRecipe(id: Int, completion: @escaping (_ recipeContent: RecipeContent?)-> Void) {
//        let request = RESTRequest(functionName: "/recipeDetail?id=\(id)", method: .get, endcoding: URLEncoding.default)
//        
//        request.baseInvoker { (result, error) in
//            if result != nil && error == nil {
//                if let recipeContent = Mapper<RecipeContent>().map(JSONObject: result) {
//                    completion(recipeContent)
//                }
//                else {
//                    completion(nil)
//                }
//            } else {
//                completion(nil)
//            }
//            
//        }
//        
//    }
    
}
