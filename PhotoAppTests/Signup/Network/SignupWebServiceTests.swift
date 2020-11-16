//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Murat Baykor on 16.11.2020.
//

import XCTest
@testable import PhotoApp

class SignupWebServiceTests: XCTestCase {

    var sut: SignupWebService!
    var signFormRequestModel: SignupFormRequestModel!
    
    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        
        signFormRequestModel = SignupFormRequestModel(firstName: "Murat", lastName: "Baykor", email: "murat@foytingo.com", password: "123456789")
        
    }

    override func tearDown() {
        
        sut = nil
        signFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }

    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnSuccess() {
        
        //Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)

        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        //Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            //Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenRecievedDifferentJSONResponse_ErrorTookPlace() {
        
        //Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)

        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        //Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            //Assert
            XCTAssertNil(signupResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SingupErrors.responseModelParsingError, "The signup() method did not return expected error")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
}
