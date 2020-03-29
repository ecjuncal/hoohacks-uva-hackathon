//
//  User.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/28/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation

class User: Codable {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var phoneNumber: Int
    var monthlyIncome: Double
    var budgetItems: [BudgetItemName: Category]
    var transactions = [Transaction]()
    
    init(email: String, password: String, firstName: String, lastName: String, phoneNumber: Int, monthlyIncome: Double, budgetItems: [BudgetItemName: Category]) {
        self.email = email
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.monthlyIncome = monthlyIncome
        self.budgetItems = budgetItems
    }
    
    func updateActualBudgetValue(transaction: Transaction) {
        let category = transaction.name
        budgetItems[category]?.addTransaction(transaction: transaction)
        transactions.append(transaction)
    }
}

enum BudgetItemName: String, Codable {
    case Housing = "Housing"
    case Food = "Food"
    case Transportation = "Transportation"
    case Savings = "Savings"
    case Other = "Other"
}
