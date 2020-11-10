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
        
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.isEmpty {
            returnValue = false
        }
        
        return returnValue
    }
}
