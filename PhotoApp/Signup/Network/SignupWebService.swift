//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Murat Baykor on 16.11.2020.
//

import Foundation

class SignupWebService {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping(SingupResponseModel?, SingupErrors?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            // TODO: Create a unit test to test that a specific error message is returned is URL is nil
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            //TODO: Write a new unit test to handle error here
            
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SingupResponseModel.self, from: data) {
                completionHandler(signupResponseModel, nil)
            } else {
                //TODO: Create a new Init Test to handle an error here
            }
        }
        
        dataTask.resume()
    }
}
