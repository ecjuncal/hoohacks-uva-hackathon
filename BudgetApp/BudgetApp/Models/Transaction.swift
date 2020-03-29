//
//  Transactions.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/28/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation

class Transaction: Codable {
    var date: Date
    var name: BudgetItemName
    var amount: Double
    
    init(date: Date, name: BudgetItemName, amount: Double) {
        self.date = date
        self.name = name
        self.amount = amount
    }
}
