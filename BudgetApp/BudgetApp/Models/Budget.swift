//
//  Budget.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/28/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation

class Budget {
    var totalEarnings: Double = 0.0
    var budgetItems: [String: Double] = [String: Double]()
    
    init(totalEarnings: Double) {
        self.totalEarnings = totalEarnings
    }
    
    public func addBudgetItem(with name: String, value: Double) {
        if budgetItems[name] != nil {
            return
        }
           
        budgetItems[name] = value
    }
    
    public func getBudgetItemValue(with name: String) -> Double {
        guard let value = budgetItems[name] else {
            return 0.0
        }
        
        return value
    }
    
    public func getPercentageValuesForBudgetItems() -> [String: Double] {
        var budgetPercentages = [String: Double]()
        
        for item in budgetItems {
            let percentage = item.value / totalEarnings
            budgetPercentages[item.key] = percentage
        }
        
        return budgetPercentages
    }
    
    public func searializeData() {
        var searializeDict = [String: Any]()
        searializeDict["totalEarnings"] = totalEarnings
        searializeDict["budgetItems"] = budgetItems
        
        //POST dictionary to endpoint
    }
}
