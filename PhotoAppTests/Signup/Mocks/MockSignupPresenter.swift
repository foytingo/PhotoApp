//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Murat Baykor on 17.11.2020.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
    
    var processUserSignupCalled: Bool = false
    
    required init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        //TODO:
    }
    
    func proccessUserSignup(formModel: SignupFormModel) {
        processUserSignupCalled = true
    }
    
    
}
