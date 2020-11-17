//
//  SignupViewController.swift
//  PhotoApp
//
//  Created by Murat Baykor on 17.11.2020.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userRepeatPasswordTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    var signupPresenter: SignupPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        if signupPresenter == nil {
            let signupModelValidator = SignupFormModelValidator()
            let webservice = SignupWebService(urlString: SignupConstants.signupURLString)
            
            signupPresenter = SingupPresenter(formModelValidator: signupModelValidator, webService: webservice, delegate: self)
        }
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let signupFormModel = SignupFormModel(firstName: userFirstNameTextField.text ?? "", lastName: userLastNameTextField.text ?? "", email: userEmailTextField.text ?? "", password: userPasswordTextField.text ?? "", repeatPassword: userRepeatPasswordTextField.text ?? "")
        
        signupPresenter?.proccessUserSignup(formModel: signupFormModel)
    }
    
}

extension SignupViewController: SignupViewDelegateProtocol {
    func successfullSignup() {
        //TODO:
    }
    
    func errorHandler(error: SignupError) {
        //TODO:
    }
    
    
}
