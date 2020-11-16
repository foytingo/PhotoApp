//
//  SingupErrors.swift
//  PhotoApp
//
//  Created by Murat Baykor on 16.11.2020.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case responseModelParsing
    case invalidRequestURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .responseModelParsing:
            return ""
        case .invalidRequestURLString:
            return ""
        case .failedRequest(let description):
            return description
        }
    }
}
