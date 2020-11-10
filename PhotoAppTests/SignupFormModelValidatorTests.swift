//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Murat Baykor on 10.11.2020.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
       
        //Arrange
        let sut = SignupFormModelValidator()
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Murat")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned True for a valid first name but returned FALSE.")
    }
    

}
