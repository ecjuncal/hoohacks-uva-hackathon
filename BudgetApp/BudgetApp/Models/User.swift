//
//  User.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/28/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation

class User {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var monthlyIncome: Double
    var budgetItems: [BudgetItemName: Double]
    
    init(email: String, password: String, firstName: String, lastName: String, monthlyIncome: Double, budgetItems: [BudgetItemName: Double]) {
        self.email = email
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.monthlyIncome = monthlyIncome
        self.budgetItems = budgetItems
    }
}

enum BudgetItemName: String {
    case Housing = "Housing"
    case Food = "Food"
    case Transportation = "Transportation"
    case Savings = "Savings"
    case Other = "Other"
}
