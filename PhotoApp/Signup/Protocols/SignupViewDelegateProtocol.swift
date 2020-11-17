//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Murat Baykor on 17.11.2020.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupError)
}
