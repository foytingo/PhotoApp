//
//  SingupPresenter.swift
//  PhotoApp
//
//  Created by Murat Baykor on 17.11.2020.
//

import Foundation

class SingupPresenter {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    
    init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol) {
        self.formModelValidator = formModelValidator
        self.webService = webService
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
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
        webService.signup(withForm: requestModel) { (responseModel, error) in
            //TODO
        }
        
    }
}
