//
//  BaseInterface.swift
//  BaseProject
//
//  Created by Navneet Singh on 15/02/21.
//

import Foundation

class BaseInterface {
    
    var baseInterfaceClosure: responseClosure? = nil
    
    func validateAndGetResponse(response: Any?) -> Dictionary<String,Any>? {
        if let response = response as? Dictionary<String,Any>,
           let success = response["success"] as? Bool,
           let actualResponse = response["response"] as? Dictionary<String,Any> {
            return actualResponse
        }
        return nil
    }
    
}
