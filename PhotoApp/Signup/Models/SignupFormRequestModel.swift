//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Murat Baykor on 16.11.2020.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
