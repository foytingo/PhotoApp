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
    
}
