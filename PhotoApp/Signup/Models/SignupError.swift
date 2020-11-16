//
//  SingupErrors.swift
//  PhotoApp
//
//  Created by Murat Baykor on 16.11.2020.
//

import Foundation

enum SignupError: Error {
    case responseModelParsing
    case invalidRequestURLString
}