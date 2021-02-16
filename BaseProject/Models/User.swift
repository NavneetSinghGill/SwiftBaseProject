//
//  User.swift
//  BaseProject
//
//  Created by Navneet Singh on 14/02/21.
//

import Foundation

class User {
    static var shared = User()
    
    var isLoggedIn: Bool = false
    var accessToken: String?
    
    func save(_ dictionary: Dictionary<String,Any>) {
        if let accessToken = dictionary[kAccessToken] as? String {
            self.accessToken = accessToken
            UserDefaults.standard.setValue(accessToken, forKey: kAccessToken)
            self.isLoggedIn = true
            UserDefaults.standard.setValue(true, forKey: kIsLoggedIn)
        }
    }
    
    func reFill() {
        if let accessToken = UserDefaults.standard.string(forKey: kAccessToken) {
            self.accessToken = accessToken
            self.isLoggedIn = true
        }
    }
    
    func reset() {
        isLoggedIn = false
        accessToken = nil
        
        UserDefaults.standard.removeObject(forKey: kAccessToken)
        UserDefaults.standard.removeObject(forKey: kIsLoggedIn)
    }
}
