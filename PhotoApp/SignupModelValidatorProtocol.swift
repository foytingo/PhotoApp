//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Murat Baykor on 17.11.2020.
//

import Foundation

protocol SignupModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
    func isPasswordValid(password: String) -> Bool
    func isPasswordTypeCheck(password: String, repatedPassword: String) -> Bool
    func isEmailValid(email: String) -> Bool
}
