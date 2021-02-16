//
//  Extensions.swift
//  BaseProject
//
//  Created by Navneet Singh on 15/02/21.
//

import Foundation

extension String {
    
    func trim() -> String{
        return self.trimmingCharacters(in: CharacterSet([" ","\n"]))
    }
    
}
