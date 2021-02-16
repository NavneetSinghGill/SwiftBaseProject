//
//  NetworkHttpClient.swift
//  BaseProject
//
//  Created by Navneet Singh on 14/02/21.
//

import Foundation
import Alamofire

class NetworkHttpClient {
    
    class func getAPIWith(url:String, params: Dictionary<String,Any>, closure: @escaping responseClosure) {
        
        let fullURL = NetworkHttpClient.getUrl() + url
        
        if let finalURL = URL(string: fullURL) {
            AF.request(finalURL, method: HTTPMethod.get, parameters: params, headers: getHeaders()) { (response) in
                
            }.responseJSON { (response) in
                
                if let error = response.error {
                    closure(false, nil, error)
                } else if response.value != nil {
                    closure(true, response.value, nil)
                } else {
                    closure(false, kSomeError, nil)
                }
            }
        }
        
    }
    
    class func getUrl() -> String {
        return kStagingURL
    }
    
    class func getHeaders() -> HTTPHeaders {
        var headers = Dictionary<String,String>()
        headers[kAccessToken] = User.shared.accessToken
        
        return HTTPHeaders(headers)
    }
    
}
