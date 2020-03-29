//
//  Category.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/28/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation

class Category: Codable {
    var expectedAmount: Double
    var actualAmount: Double
    
    init(expectedAmount: Double, actualAmount: Double) {
        self.expectedAmount = expectedAmount
        self.actualAmount = actualAmount
    }
    
    func addTransaction(transaction: Transaction) {
        self.actualAmount = self.actualAmount + transaction.amount
    }
}
