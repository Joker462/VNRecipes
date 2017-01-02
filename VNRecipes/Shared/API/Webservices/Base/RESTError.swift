//
//  RESTError.swift
//  9Gags
//
//  Created by iOs_Dev on 1/8/16.
//  Copyright © 2016 Duong Tran. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class RESTError: RESTResponse {
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    static func parseError(response: DataResponse<Any>) -> RESTError {
        let restError = RESTError()
        if let message = response.result.value, let statusCode = response.response?.statusCode {
            restError.message = message as? String ?? ""
            restError.statusCode = statusCode
        }
        return restError
    }
}
