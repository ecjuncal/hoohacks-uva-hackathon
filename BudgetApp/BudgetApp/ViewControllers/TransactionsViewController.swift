//
//  TransactionsViewController.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/29/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation
import UIKit

class TransactionsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var user: User?
    let pickerData = [BudgetItemName.Food, BudgetItemName.Housing, BudgetItemName.Transportation, BudgetItemName.Savings, BudgetItemName.Other]
    
    @IBOutlet var categoryPickerView: UIPickerView!
    @IBOutlet var categoryAmountTextField: UITextField!
    @IBOutlet var transactionsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let masterView = self.tabBarController as? TabbarMasterViewController else {
            return
        }
        
        self.user = masterView.user
        self.categoryPickerView.delegate = self
        self.categoryPickerView.dataSource = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].rawValue
    }
    
    func setupTransactionTextField() {
        guard let transactions = self.user?.transactions else {
            return
        }
        
        for transaction in transactions {
            self.addToTransactionTextField(with: transaction)
        }
    }
    
    @IBAction func addTransactionPressed(_ sender: Any) {
        self.categoryAmountTextField.isEnabled = false
        guard let amount = categoryAmountTextField.getDoubleData(with: "Error, enter a valid number") else {
            self.categoryAmountTextField.isEnabled = true
            return
        }
        let category = pickerData[categoryPickerView.selectedRow(inComponent: 0)]
        let transaction = Transaction.init(date: Date(), name: category, amount: amount)
        self.user?.updateActualBudgetValue(transaction: transaction)
        self.categoryAmountTextField.isEnabled = true
        self.addToTransactionTextField(with: transaction)
    }
    
    @IBAction func resetTextField(_ sender: UITextField) {
        sender.isEnabled = true
        sender.textColor = .black
        sender.text = ""
    }
    
    func addToTransactionTextField(with transaction: Transaction) {
        let shortDateFormat = DateFormatter()
        shortDateFormat.dateStyle = .short
        
        let transactionsString = "Transaction type: " + transaction.name.rawValue + " | Amount: " + String(format: "$%.02f", transaction.amount) + " | Date: " + shortDateFormat.string(from: transaction.date) + "\n"
        transactionsTextView.text += transactionsString
    }
}
