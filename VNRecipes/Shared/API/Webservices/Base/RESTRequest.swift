import Foundation
import Alamofire
import ObjectMapper

typealias RestAPICompletion = (_ result: AnyObject?, _ error: RESTError?) -> Void
typealias RestDownloadProgress = (_ bytesRead : Int64, _ totalBytesRead : Int64, _ totalBytesExpectedToRead : Int64) -> Void

class RESTRequest: NSObject {
    
    var baseUrl: String = ""
    var parameters: [String: AnyObject] = [:]
    var headers: [String: String] = RESTContants.Headers
    var multiparts = NSMutableArray()
    var requestMethod: Alamofire.HTTPMethod = .get
    var endcoding: ParameterEncoding = URLEncoding.default
    
    //MARK: Base
    init(url: String, functionName: String, method: Alamofire.HTTPMethod, endcoding: ParameterEncoding = URLEncoding.default) {
        super.init()
        self.handleInit(baseUrl: url + functionName, method: method, endcoding: endcoding)
    }
    
    init(functionName: String, method: Alamofire.HTTPMethod, endcoding: ParameterEncoding) {
        super.init()
        self.handleInit(baseUrl: RESTContants.BaseURL + functionName, method: method, endcoding: endcoding)
    }
    
    func handleInit(baseUrl: String, method: Alamofire.HTTPMethod, endcoding: ParameterEncoding) {
        self.baseUrl = baseUrl
        self.endcoding = endcoding
        self.requestMethod = method
    }
    
    //MARK: Properties
    func setQueryParam(param: RESTParam) {
        parameters = param.toDictionary()
    }
    
    func addQueryParam(name: String, value: AnyObject?) {
        if let dataValue = value as? NSData {
            parameters[name] = dataValue
        } else {
            parameters[name] = value
        }
    }
    
    func addHeader(name: String, value: AnyObject?) {
        headers[name] = value as? String
    }
    
    func setContentType(contentType: String) {
        headers[RESTContants.RequestContentTypeKey] = contentType
    }
    
    func setAccept(accept: String) {
        headers[RESTContants.RequestAcceptKey] = accept
    }
    
    func setAuthorization(authorization: String) {
        headers[RESTContants.RequestAuthorizationKey] = authorization
    }
    
    func addPartJson(name: String, model: NSObject) {
        let part = RESTMultipart.JSONPart(name: name, jsonObject: model)
        self.multiparts.add(part)
    }
    
    func addPartFile(name: String, fileName: String, data: NSData) {
        let part = RESTMultipart.FilePart(name: name, fileName: fileName, data: data)
        self.multiparts.add(part)
    }
    
    //MARK: Alamofire functions
    func baseInvoker(completion: @escaping RestAPICompletion) {
        Alamofire.request(baseUrl, method: requestMethod , parameters: parameters, encoding: endcoding)
            .responseJSON { response in
                guard response.response?.statusCode == RESTContants.StatusCodeSuccess else {
                    completion(nil, RESTError.parseError(response: response))
                    return
                }
                completion(response.result.value as AnyObject?, nil)
        }
    }
    
    
    //  func handleResponse(response: DataResponse<Any>, completion: RestAPICompletion) {
    //    if response.response?.statusCode == RESTContants.StatusCodeSuccess
    //      || response.response?.statusCode == RESTContants.StatusCodeLogin
    //      || response.response?.statusCode == RESTContants.StatusCodeAdded {
    //      completion(result: response.result.value, error: nil)
    //    } else {
    //      if response.response?.statusCode == RESTContants.Unathorizated
    //      || response.response?.statusCode == RESTContants.MethodNotAllowed {
    //        FlowManager.expiredToken()
    //      }
    //      completion(result: nil, error: RESTError.parseError(response))
    //    }
    //  }
    //
    //    func imageType(imgData : NSData) -> String {
    //        var c = [UInt8](count: 1, repeatedValue: 0)
    //        imgData.getBytes(&c, length: 1)
    //
    //        let ext : String
    //
    //        switch (c[0]) {
    //        case 0xFF: ext = "jpg"
    //            
    //        case 0x89: ext = "png"
    //            
    //        case 0x47: ext = "gif"
    //            
    //        case 0x49, 0x4D : ext = "tiff"
    //            
    //        default: ext = "jpg" //unknown
    //        }
    //        return ext
    //    }
}

