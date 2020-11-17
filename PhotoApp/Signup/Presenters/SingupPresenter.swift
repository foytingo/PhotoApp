//
//  SingupPresenter.swift
//  PhotoApp
//
//  Created by Murat Baykor on 17.11.2020.
//

import Foundation

class SingupPresenter {
    
    private var formModelValidator: SignupModelValidatorProtocol
    
    init(formModelValidator: SignupModelValidatorProtocol) {
        self.formModelValidator = formModelValidator
    }
    
    func proccessUserSignup(formModel: SignupFormModel){
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        
        if !formModelValidator.isEmailValid(email: formModel.email) {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        
        if !formModelValidator.isPasswordTypeCheck(password: formModel.password, repatedPassword: formModel.repeatPassword){
            return
        }
        
    }
}
