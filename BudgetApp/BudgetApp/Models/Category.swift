//
//  Category.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/28/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation

class Category {
    var name: String
    var amount: Double
    
    init(name: String, amount: Double) {
        self.name = name
        self.amount = amount
    }
}
