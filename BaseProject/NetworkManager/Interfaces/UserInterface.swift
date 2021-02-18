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
                self.parseLogin(response: response)
            } else if (error != nil) {
                self.baseInterfaceClosure!(false, nil, error)
            } else if response != nil {
                self.baseInterfaceClosure!(false, response, nil)
            }
        })
    }
    
    func parseLogin(response: Any?) {
        if let response = self.validateAndGetResponse(response: response) {
            User.shared.save(response)
            baseInterfaceClosure!(true, nil, nil)
        }
    }
    
}
