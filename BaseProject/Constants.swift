//
//  Constants.swift
//  BaseProject
//
//  Created by Navneet Singh on 14/02/21.
//

import UIKit

//MARK: - Shortcuts
typealias responseClosure = (_ success: Bool, _ response: Any?, _ error: Error?) -> Void

let appDelegate = UIApplication.shared.delegate as! AppDelegate

//MARK: - User
let kAccessToken = "accessToken"
let kIsLoggedIn = "isLoggedIn"

//MARK: - URL
let kStagingURL = "http://127.0.0.1:3000"

let kLoginURL = "/login"

//MARK: - Strings
let noNetwork = "No network available"
let kSomeError = "Something went wrong while processing your request"
