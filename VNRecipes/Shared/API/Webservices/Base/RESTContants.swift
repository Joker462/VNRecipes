//
//  RESTContants.swift
//  9Gags
//
//  Created by iOs_Dev on 108/16.
//  Copyright © 2016 Duong Tran. All rights reserved.
//

import Foundation

class RESTContants: NSObject {
  
  //MARK: RESTRequest Header Keys
  static let RequestHeaderKey                   = "Header"
  static let RequestAuthorizationKey            = "Authorization"
  static let RequestContentTypeKey              = "Content-Type"
  static let RequestAcceptKey                   = "Accept"
  static let Headers                            = ["Content-Type" : "application/json"]
  static let PrefixToken                        = "Bearer "
  
  //MARK: Keys for parser
  static let SuccessKeyFromResponseData         = "status"
  static let MessageKeyFromResponseData         = "error"
  static let DefaultMessageKeyFromResponseData  = "unknow_error"
  
  //MARK: Prepairing request
  static let RequestTimeOut                     = 90.0
  static let StatusCodeSuccess                  = 200
  static let StatusCodeAdded                    = 201
  static let StatusCodeLogin                    = 302
  static let Unathorizated                      = 401
  static let MethodNotAllowed                   = 405
  
  //MARK: Webservice url
  static let Hostname                           = "demo6019678.mockable.io"
  static let BaseURL                            = "http://demo6019678.mockable.io"
  
}
