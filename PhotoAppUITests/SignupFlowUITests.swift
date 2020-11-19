//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Murat Baykor on 10.11.2020.
//

import XCTest

class SignupFlowUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launchArguments = ["-skipSurvey" , "-debugServer"]
//        app.launchEnvironment = ["signupURL" : "http://appsdeveloperblog.com/api/v2/signup-mock-service/users",
//                                 "inAppPurchasesEnabled" : "true",
//                                 "inAppAdsEnabled": "true"]
        app.launch()
        
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        email = app.textFields["emailTextField"]
        password = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["Signup"]
                
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        try super.tearDownWithError()
    }

    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {

        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interactions.")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interactions.")
        XCTAssertTrue(email.isEnabled, "Email UITextField is not enabled for user interactions.")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions.")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat Password UITextField is not enabled for user interactions.")
        XCTAssertTrue(signupButton.isEnabled, "Signup button is not enabled for user interactions.")

    }
    
    
    func testSignupViewController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog() {
        
        //Arrange
        firstName.tap()
        firstName.typeText("M")
        
        lastName.tap()
        lastName.typeText("B")
        
        email.tap()
        email.typeText("@")
        
        password.tap()
        password.typeText("1234")
        
        repeatPassword.tap()
        repeatPassword.typeText("14")
        
        //Act
        signupButton.tap()

        //Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An Error Alert dialog was not presented when invalid signup from was submitted.")
    }
    
    
    func testSignupViewController_WhenValidFormSubmitted_PresentsSuccessAlertDialog() {
        
        //Arrange
        firstName.tap()
        firstName.typeText("Murat")
        
        lastName.tap()
        lastName.typeText("Baykor")
        
        email.tap()
        email.typeText("murat@foytingo.com")
        
        password.tap()
        password.typeText("123456789")
        
        repeatPassword.tap()
        repeatPassword.typeText("123456789")
        
        //Act
        signupButton.tap()

        //Assert
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 1), "An Success Alert dialog was not presented when valid signup from was submitted.")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
