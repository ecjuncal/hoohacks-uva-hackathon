//
//  SignUpViewController.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/28/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    var email: String = ""
    var password: String = ""
    var user: User?
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var monthlyIncomeTextField: UITextField!
    @IBOutlet var housingAmount: UITextField!
    @IBOutlet var foodAmount: UITextField!
    @IBOutlet var transportationAmount: UITextField!
    @IBOutlet var savingsAmount: UITextField!
    @IBOutlet var otherAmount: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TabbarMasterViewController {
            if let user = self.user as? User {
                destination.setUser(with: user)
            }
            /*
            if let pieChartVC = destination.viewControllers![0] as? PieChartViewController {
                pieChartVC.user = user
            }*/
        }
    }
    
    @IBAction func donePressed(_ sender: Any) {
        guard let user = authenticateValues() else {
            return
        }
        
        self.user = user
        performSegue(withIdentifier: "doneButtonPressed", sender: self)
    }
    
    private func authenticateValues() -> User? {
        self.setEnableForTextFields(with: false)
        guard let firstName = firstNameTextField.checkEmptySubmission(with: "Please enter a valid name"),
            let lastName = lastNameTextField.checkEmptySubmission(with: "Please enter a valid name"),
            let phoneNumber = phoneNumberTextField.getPhoneData(with: "Phone number not valid"),
            let monthlyIncome = monthlyIncomeTextField.getDoubleData(with: "Please enter a valid number"),
            let housingAmount = housingAmount.getDoubleData(with: "Please enter a valid number"),
            let foodAmount = foodAmount.getDoubleData(with: "Please enter a valid number"),
            let transportationAmount = transportationAmount.getDoubleData(with: "Please enter a valid number"),
            let savingsAmount = savingsAmount.getDoubleData(with: "Please enter a valid number"),
            let otherAmount = otherAmount.getDoubleData(with: "Please enter a valid number") else {
            self.setEnableForTextFields(with: true)
            return nil
        }
            
        var budgetDict = [BudgetItemName: Category]()
        budgetDict[BudgetItemName.Housing] = Category.init(expectedAmount: housingAmount, actualAmount: 0.0)
        budgetDict[BudgetItemName.Food] = Category.init(expectedAmount: foodAmount, actualAmount: 0.0)
        budgetDict[BudgetItemName.Transportation] = Category.init(expectedAmount: transportationAmount, actualAmount: 0.0)
        budgetDict[BudgetItemName.Savings] = Category.init(expectedAmount: savingsAmount, actualAmount: 0.0)
        budgetDict[BudgetItemName.Other] = Category.init(expectedAmount: otherAmount, actualAmount: 0.0)
            
        return User(email: email, password: password, firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, monthlyIncome: monthlyIncome, budgetItems: budgetDict)
    }
    
    @IBAction func resetTextField(_ sender: UITextField) {
        sender.textColor = .black
        sender.text = ""
    }
    
    func setEnableForTextFields(with value: Bool) {
        firstNameTextField.isEnabled = value
        lastNameTextField.isEnabled = value
        phoneNumberTextField.isEnabled = value
        monthlyIncomeTextField.isEnabled = value
        housingAmount.isEnabled = value
        foodAmount.isEnabled = value
        transportationAmount.isEnabled = value
        savingsAmount.isEnabled = value
        otherAmount.isEnabled = value
    }
}
