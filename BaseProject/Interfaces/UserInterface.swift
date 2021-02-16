//
//  UserInterface.swift
//  BaseProject
//
//  Created by Navneet Singh on 14/02/21.
//

import Foundation

class UserInterface: BaseInterface {
    
    func performLoginWith(_ request: BaseRequest, closure: @escaping responseClosure) {
        baseInterfaceClosure = closure
        
        NetworkHttpClient.getAPIWith(url: request.urlSuffix, params: request.parameters, closure: {
            success, response, error in
            if success {
                parseLogin(response: response)
            } else if (error != nil) {
                baseInterfaceClosure!(false, error?.localizedDescription, nil)
            } else if response != nil {
                baseInterfaceClosure!(false, response, nil)
            }
        })
    }
    
    func parseLogin(response: Any?) {
        print(response)
    }
    
}
