//
//  User.swift
//  BaseProject
//
//  Created by Navneet Singh on 14/02/21.
//

import Foundation

class User {
    static var shared = User()
    
    var accessToken: String?
    
    func save(_ dictionary: Dictionary<String,String>) {
        accessToken = dictionary[kAccessToken]
        UserDefaults.standard.setValue(accessToken, forKey: kAccessToken)
    }
    
    func reFill() {
        if let accessToken = UserDefaults.standard.string(forKey: kAccessToken) {
            self.accessToken = accessToken
        }
    }
}
