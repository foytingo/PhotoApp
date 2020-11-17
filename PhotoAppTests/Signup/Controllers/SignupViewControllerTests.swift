//
//  SignupViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Murat Baykor on 17.11.2020.
//

import XCTest
@testable import PhotoApp

class SignupViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUp() {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as SignupViewController
        
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        storyboard = nil
        sut = nil
    }


    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() throws {
        
        let userFirstNameTextField = try XCTUnwrap(sut.userFirstNameTextField, "The userFirstNameTextField is not connection to an IBOutlet")
        let userLastNameTextField = try XCTUnwrap(sut.userLastNameTextField, "The userLastNameTextField is not connection to an IBOutlet")
        let userEmailTextField = try XCTUnwrap(sut.userEmailTextField, "The userEmailTextField is not connection to an IBOutlet")
        let userPasswordTextField = try XCTUnwrap(sut.userPasswordTextField, "The userPasswordTextField is not connection to an IBOutlet")
        let userRepeatPasswordTextField = try XCTUnwrap(sut.userRepeatPasswordTextField, "The userRepeatPasswordTextField is not connection to an IBOutlet")
        
        XCTAssertEqual(userFirstNameTextField.text, "", "First name text field was not empty when the view controller intially loaded.")
        XCTAssertEqual(userLastNameTextField.text, "", "Last name text field was not empty when the view controller intially loaded.")
        XCTAssertEqual(userEmailTextField.text, "", "Email text field was not empty when the view controller intially loaded.")
        XCTAssertEqual(userPasswordTextField.text, "", "Password text field was not empty when the view controller intially loaded.")
        XCTAssertEqual(userRepeatPasswordTextField.text, "", "Repeat password text field was not empty when the view controller intially loaded.")
    }
    
    func testSignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        //Arrange
        let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "Signup button does not have a referencing outlet.")
        
        //Act
        let signupButtonAction = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup button does not have any action assigned to it")
        
        //Assert
        XCTAssertEqual(signupButtonAction.count, 1)
        XCTAssertEqual(signupButtonAction.first, "signupButtonTapped:", "There is no action with a name signupButtonTapped assigned to signup button.")
    }
    
    func testSignupViewController_WhenSignupButtonTapped_InvokesSignupProcess() {
        //Arrange
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()
        
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService, delegate: mockSignupViewDelegate)
        
        sut.signupPresenter = mockSignupPresenter
        
        //Act
        sut.signupButton.sendActions(for: .touchUpInside)
        
        //Assert
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled, "The processUserSignupCalled() method was not called on a Presenter object when the signup button was tapped in a SignupViewController")
    }
}
