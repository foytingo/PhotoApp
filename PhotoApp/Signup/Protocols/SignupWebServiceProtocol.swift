//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Murat Baykor on 17.11.2020.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping(SingupResponseModel?, SignupError?) -> Void)
}
