//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Murat Baykor on 17.11.2020.
//

import XCTest
@testable import PhotoApp

class SignupPresenterTests: XCTestCase {

    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var mockSignupViewDelegate: MockSignupViewDelegate!
    var sut: SingupPresenter!
    
    override func setUp() {
        signupFormModel = SignupFormModel(firstName: "Murat", lastName: "Baykor", email: "murat@foytingo.com", password: "123456789", repeatPassword: "123456789")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        sut = SingupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService, delegate: mockSignupViewDelegate)
    }

    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        mockSignupViewDelegate = nil
        sut = nil
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        //Arrange
        //Act
        sut.proccessUserSignup(formModel: signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstnameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Email was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isRepeatedPasswordValidated, "Did not validate if passwords match")
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        //Arrange
        //Act
        sut.proccessUserSignup(formModel: signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup() method was not called in the SignupWebService class")
    }
    
    func testSignupPresenter_WhenSignupOperationSuccessful_CallsSuccessOnViewDelegate() {
        //Arrange
        let myExpectation = expectation(description: "Expected the successfulSignup() method to be called")
        
        mockSignupViewDelegate.expectation = myExpectation
        
        //Act
        sut.proccessUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        //Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 1, "The successfulSignUp() method called more than one")
    }
    
    func testSignupPresenter_WhenSignupOperationNotSuccessfull_CallsErrorOnViewDelegate() {
        //Arrange
        let myErrorExpectation = expectation(description: "Expected the errorHandling() method to be called")
        mockSignupViewDelegate.expectation = myErrorExpectation
        mockSignupWebService.shouldReturnError = true
        
        //Act
        sut.proccessUserSignup(formModel: signupFormModel)
        self.wait(for: [myErrorExpectation], timeout: 5)
        
        //Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 0)
        XCTAssertEqual(mockSignupViewDelegate.errorHandleCounter, 1)
        XCTAssertNotNil(mockSignupViewDelegate.signupError)
    }
}
