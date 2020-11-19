//
//  SingupPresenter.swift
//  PhotoApp
//
//  Created by Murat Baykor on 17.11.2020.
//

import Foundation

class SingupPresenter: SignupPresenterProtocol {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
    
    required init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
    }
    
    func proccessUserSignup(formModel: SignupFormModel){
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            delegate?.errorHandler(error: SignupError.invalidFirstName)
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            delegate?.errorHandler(error: SignupError.invalidLastName)
            return
        }
        
        if !formModelValidator.isEmailValid(email: formModel.email) {
            delegate?.errorHandler(error: SignupError.invalidEmail)
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            delegate?.errorHandler(error: SignupError.invalidPassword)
            return
        }
        
        if !formModelValidator.isPasswordTypeCheck(password: formModel.password, repatedPassword: formModel.repeatPassword){
            delegate?.errorHandler(error: SignupError.passwordDoNotMatch)
            return
        }
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
        webService.signup(withForm: requestModel) { [weak self](responseModel, error) in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                return
            }
            if responseModel != nil {
                self?.delegate?.successfullSignup()
                return
            }
        }
        
    }
}
