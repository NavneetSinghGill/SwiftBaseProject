//
//  UserRequestManager.swift
//  BaseProject
//
//  Created by Navneet Singh on 14/02/21.
//

import Foundation

class UserRequestManager {
    
    func loginWith(_ email: String, _ password: String, closure: @escaping responseClosure) {
        if appDelegate.isNetworkAvailable {
            UserInterface().performLoginWith(UserRequest().createLoginRequestWith(email, password), closure: closure)
        } else {
            closure(false, noNetwork, nil)
        }
    }
    
}
