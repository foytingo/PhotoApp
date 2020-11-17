//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Murat Baykor on 17.11.2020.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    
    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    var errorHandleCounter = 0
    var signupError: SignupError?
    
    func successfullSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        signupError = error
        errorHandleCounter += 1
        expectation?.fulfill()
    }
    

}
