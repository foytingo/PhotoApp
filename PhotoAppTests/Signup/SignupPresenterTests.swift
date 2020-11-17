//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Murat Baykor on 17.11.2020.
//

import XCTest
@testable import PhotoApp

class SignupPresenterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        //Arrange
        let signupFormModel = SignupFormModel(firstName: "Murat", lastName: "Baykor", email: "murat@foytingo.com", password: "123456789", repeatPassword: "123456789")
        
        let mockSignupModelValidator = MockSignupModelValidator()
        let sut = SingupPresenter(formModelValidator: mockSignupModelValidator)
        
        //Act
        sut.proccessUserSignup(formModel: signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstnameValidated)
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated)
        XCTAssertTrue(mockSignupModelValidator.isRepeatedPasswordValidated)
    }
}
