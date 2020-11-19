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

//        #if DEBUG
//        if CommandLine.arguments.contains("-skipSurvey") {
//            print("Skipping survey page")
//        }
//        #endif
//
//        #if DEBUG
//        if ProcessInfo.processInfo.arguments.contains("-skipSurvey") {
//            print("Skipping survey page")
//        }
//        #endif
        
        
        if signupPresenter == nil {
            let signupModelValidator = SignupFormModelValidator()
            
            let signupUrl = ProcessInfo.processInfo.environment["signupURL"] ?? SignupConstants.signupURLString
            
            let webservice = SignupWebService(urlString: signupUrl)
            
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
        let alert = UIAlertController(title: "Success", message: "Your signup operation was successful.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "successAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func errorHandler(error: SignupError) {
        let alert = UIAlertController(title: "Error", message: "Your request could not be processed at this time.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
