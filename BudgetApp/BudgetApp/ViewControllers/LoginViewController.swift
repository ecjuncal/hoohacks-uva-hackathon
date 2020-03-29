//
//  LoginViewController.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/28/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController  {
    var email: String = ""
    var password: String = ""
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SignUpViewController {
            destination.email = email
            destination.password = password
        }
    }
    
    @IBAction func login(_ sender: Any) {
        emailTextField.isEnabled = false
        passwordTextField.isEnabled = false
        
        guard let email = emailTextField.checkEmptySubmission(with: "Please enter a valid email"),
            let password = passwordTextField.checkEmptySubmission(with: "Please enter a valid password") else {
                emailTextField.isEnabled = true
                passwordTextField.isEnabled = true
                passwordTextField.isSecureTextEntry = false
                return
        }
        
        self.email = email
        self.password = password
        performSegue(withIdentifier: "loginButtonPressed", sender: self)
    }
    
    @IBAction func signUp(_ sender: Any) {
        emailTextField.isEnabled = false
        passwordTextField.isEnabled = false
        
       guard let email = emailTextField.checkEmptySubmission(with: "Please enter a valid email"),
            let password = passwordTextField.checkEmptySubmission(with: "Please enter a valid password") else {
                emailTextField.isEnabled = true
                passwordTextField.isEnabled = true
                passwordTextField.isSecureTextEntry = false
                return
        }
        
        self.email = email
        self.password = password
        performSegue(withIdentifier: "signUpButtonPressed", sender: self)
    }
    
    @IBAction func resetTextField(_ sender: UITextField) {
        sender.isEnabled = true
        sender.textColor = .black
        sender.text = ""
        
        if sender.accessibilityIdentifier == "passwordTextField" {
            sender.isSecureTextEntry = true
        }
    }
}
