//
//  Transactions.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/28/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation

class Transaction {
    var date: Date
    var contents: String
    var amount: Double
    
    init(date: Date, contents: String, amount: Double) {
        self.date = date
        self.contents = contents
        self.amount = amount
    }
}
