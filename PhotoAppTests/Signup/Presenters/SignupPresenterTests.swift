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
    var sut: SingupPresenter!
    
    override func setUp() {
        signupFormModel = SignupFormModel(firstName: "Murat", lastName: "Baykor", email: "murat@foytingo.com", password: "123456789", repeatPassword: "123456789")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        sut = SingupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService)
    }

    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
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
}
