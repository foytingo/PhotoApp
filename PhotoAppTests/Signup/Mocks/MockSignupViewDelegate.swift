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
    func successfullSignup() {
        
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        //
    }
    

}
