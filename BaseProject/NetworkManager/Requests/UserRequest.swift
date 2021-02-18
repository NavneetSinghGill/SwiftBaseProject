//
//  UserRequest.swift
//  BaseProject
//
//  Created by Navneet Singh on 14/02/21.
//

import Foundation

class UserRequest: BaseRequest {
    
    func createLoginRequestWith(_ email: String, _ password: String) -> UserRequest {
        parameters["email"] = email
        parameters["password"] = password
        
        urlSuffix = kLoginURL
        
        return self
    }
    
}
