//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by Murat Baykor on 17.11.2020.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SingupResponseModel?, SignupError?) -> Void) {
        
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SignupError.failedRequest(description: "Signup request was not successful"))
        } else {
            let responseModel = SingupResponseModel(status: "Ok")
            completionHandler(responseModel,nil)
        }

    }
    
    
}
