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
}
