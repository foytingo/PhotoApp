//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Murat Baykor on 10.11.2020.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {

    var sut: SignupFormModelValidator!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignupFormModelValidator()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    
    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
       
        //Arrange
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Murat")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE.")
    }
    
    
    func testSignFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        //Arrange
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "M")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE.")
    }
    
    
    func testSignFormModelValidator_WhenTooLongFirstNameProvided_ShuoldReturnFalse() {
        
        //Arrange
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "MuratMuratMurat")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE.")
    }
    
    
    func testSignFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        
        //Arrange
        //Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Baykor")
        
        //Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid first name but returned FALSE.")
    }
    
    func testSignFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        //Arrange
        //Act
        let isLastNameValid = sut.isLastNameValid(lastName: "B")
        
        //Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have FALSE for a first name that is shorter than \(SignupConstants.lastNameMinLength) characters but it has returned TRUE.")
    }
    
    func testSignFormModelValidator_WhenTooLongLastNameProvided_ShuoldReturnFalse() {
        
        //Arrange
        //Act
        let isLastNameValid = sut.isLastNameValid(lastName: "BaykorBaykor")
        
        //Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have FALSE for a first name that is longer than \(SignupConstants.lastNameMaxLength) characters but it has returned TRUE.")
    }
    
    func testSignFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        
        //Arrange
        //Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678")
        
        //Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password but returned FALSE")
    }
    
    func testSignFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        
        //Arrange
        //Act
        let isPasswordValid = sut.isPasswordValid(password: "123")
        
        //Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have FALSE for a password that is shorter than \(SignupConstants.passwordMinLength) charaters but it has returned TRUE")
    }
    
    func testSignFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        
        //Arrange
        //Act
        let isPasswordValid = sut.isPasswordValid(password: "1234567891011")
        
        //Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have FALSE for a password that is longer than \(SignupConstants.passwordMaxLength) charaters but it has returned TRUE")
    }
    
    func testSignFormModelValidator_WhenEqualCheckPassword_ShouldReturnTrue() {
        
        //Arrange
        //Act
        let isPasswordValid = sut.isPasswordTypeCheck(password: "123456", repatedPassword: "123456")
        
        //Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordTypeCheck() should have TRUE for  passwords match but it has returned FALSE")
    }
    
    func testSignFormModelValidator_WhenNotEqualCheckPassword_ShouldReturnFalse() {
        
        //Arrange
        //Act
        let isPasswordValid = sut.isPasswordTypeCheck(password: "123456", repatedPassword: "654321")
        
        //Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordTypeCheck() should have FALSE for passwords match but it has returned TRUE")
    }
    
    func testSignFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        
        //Arrange
        //Act
        let isEmailValid = sut.isEmailValid(email: "murat@foytingo.com")
        
        //Assert
        XCTAssertTrue(isEmailValid, "The isEmailValid() should have return TRUE for a valid email but returned FALSE")
    }
    
    
    func testSignFormModelValidator_WhenValidEmailNotProvided_ShouldReturnFalse() {
        
        //Arrange
        //Act
        let isEmailValid = sut.isEmailValid(email: "murat")
        
        //Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have return FALSE for a invalid email but returned TRUE")
    }
    
}
