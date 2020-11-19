//
//  SingupErrors.swift
//  PhotoApp
//
//  Created by Murat Baykor on 16.11.2020.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    case invalidFirstName
    case invalidLastName
    case invalidEmail
    case invalidPassword
    case passwordDoNotMatch
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel, .invalidRequestURLString, .passwordDoNotMatch, .invalidEmail, .invalidPassword, .invalidFirstName, .invalidLastName:
            return ""
        }
    }
    
}
