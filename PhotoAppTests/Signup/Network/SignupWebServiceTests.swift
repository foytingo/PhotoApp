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
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        
        let signFormRequestModel = SignupFormRequestModel(firstName: "Murat", lastName: "Baykor", email: "murat@foytingo.com", password: "123456789")
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        //Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            
            //Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
}
