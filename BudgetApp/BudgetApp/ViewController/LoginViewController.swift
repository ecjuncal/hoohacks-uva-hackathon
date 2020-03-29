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
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        if authenticateEmail(with: email) && authenticatePassword(with: password) {
            self.email = email
            self.password = password
            performSegue(withIdentifier: "loginButtonPressed", sender: self)
        } else {
            //handle stuff
            emailTextField.isEnabled = true
            passwordTextField.isEnabled = true
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        emailTextField.isEnabled = false
        passwordTextField.isEnabled = false
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        if authenticateEmail(with: email) && authenticatePassword(with: password) {
            self.email = email
            self.password = password
            performSegue(withIdentifier: "signUpButtonPressed", sender: self)
        } else {
            //handle stuff
            emailTextField.isEnabled = true
            passwordTextField.isEnabled = true
        }
    }
    
    private func authenticateEmail(with email: String) -> Bool {
        if email.isEmpty {
            self.setEmailError()
            return false
        }
        return true
    }
    
    private func authenticatePassword(with password: String) -> Bool {
        if password.isEmpty {
            self.setPasswordError()
            return false
        }
        return true
    }
    
    private func setEmailError() {
        emailTextField.textColor = .red
        emailTextField.text = "Please enter a valid email"
    }
    
    private func setPasswordError() {
        passwordTextField.isSecureTextEntry = false
        passwordTextField.textColor = .red
        passwordTextField.text = "Please enter a valid password"
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
