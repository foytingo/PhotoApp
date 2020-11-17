//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by Murat Baykor on 17.11.2020.
//

import Foundation
@testable import PhotoApp

class MockSignupModelValidator: SignupModelValidatorProtocol {
    
    var isFirstnameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailValidated: Bool = false
    var isPasswordValidated: Bool = false
    var isRepeatedPasswordValidated: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstnameValidated = true
        return isFirstnameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func isPasswordTypeCheck(password: String, repatedPassword: String) -> Bool {
        isRepeatedPasswordValidated = true
        return isRepeatedPasswordValidated
    }
    
    func isEmailValid(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }

    
}
