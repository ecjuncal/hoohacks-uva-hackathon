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
    @IBOutlet var monthlyIncomeTextField: UITextField!
    @IBOutlet var housingAmount: UITextField!
    @IBOutlet var foodAmount: UITextField!
    @IBOutlet var transportationAmount: UITextField!
    @IBOutlet var savingsAmount: UITextField!
    @IBOutlet var otherAmount: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UITabBarController {
            if let pieChartVC = destination.viewControllers![0] as? PieChartViewController {
                pieChartVC.user = user
            }
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
        guard let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text,
            let monthlyIncome = monthlyIncomeTextField.text,
            let housingAmount = housingAmount.text,
            let foodAmount = foodAmount.text,
            let transportationAmount = transportationAmount.text,
            let savingsAmount = savingsAmount.text,
            let otherAmount = otherAmount.text else {
            return nil
        }
        
        if let monthlyIncomeValue = Double(monthlyIncome),
            let housingAmountValue = Double(housingAmount),
            let foodAmountValue = Double(foodAmount),
            let transportationAmountValue = Double(transportationAmount),
            let savingsAmountValue = Double(savingsAmount),
            let otherAmountValue = Double(otherAmount){
            
            var budgetDict = [BudgetItemName: Double]()
            budgetDict[BudgetItemName.Housing] = housingAmountValue
            budgetDict[BudgetItemName.Food] = foodAmountValue
            budgetDict[BudgetItemName.Transportation] = transportationAmountValue
            budgetDict[BudgetItemName.Savings] = savingsAmountValue
            budgetDict[BudgetItemName.Other] = otherAmountValue
            
            return User(email: email, password: password, firstName: firstName, lastName: lastName, monthlyIncome: monthlyIncomeValue, budgetItems: budgetDict)
        }
        
        return nil
    }
}
