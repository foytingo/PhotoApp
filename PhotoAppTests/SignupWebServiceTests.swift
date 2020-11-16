//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Murat Baykor on 16.11.2020.
//

import XCTest
@testable import PhotoApp

class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnSuccess() {
        
        //Arrange
        let sut = SignupWebService()
        
        let signFormRequestModel = SignupFormRequestModel(firstName: "Murat", lastName: "Baykor", email: "murat@foytingo.com", password: "123321")
        
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            
        }
    }
    
}
