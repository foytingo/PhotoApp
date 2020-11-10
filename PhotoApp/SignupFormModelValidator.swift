//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Murat Baykor on 10.11.2020.
//

import Foundation

class SignupFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < 2 {
            returnValue = false
        }
        
        return returnValue
    }
}
