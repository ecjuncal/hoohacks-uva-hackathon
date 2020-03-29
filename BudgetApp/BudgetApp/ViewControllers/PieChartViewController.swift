//
//  PieChartViewController.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/28/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation
import Charts
import UIKit

class PieChartViewController: UIViewController {
    
    private let foodColor = UIColor.red
    private let housingColor = UIColor.orange
    private let transportationColor = UIColor.purple
    private let savingsColor = UIColor.systemGreen
    private let otherColor = UIColor.blue
    
    @IBOutlet var pieChartView: PieChartView!
    @IBOutlet var foodAmountTextField: UITextField!
    @IBOutlet var housingAmountTextField: UITextField!
    @IBOutlet var transportationAmountTextField: UITextField!
    @IBOutlet var savingsAmountTextField: UITextField!
    @IBOutlet var otherAmountTextField: UITextField!
    
    var user: User?
    var foodItem = PieChartDataEntry(value: 0)
    var housingItem = PieChartDataEntry(value: 0)
    var transportationItem = PieChartDataEntry(value: 0)
    var savingsItem = PieChartDataEntry(value: 0)
    var otherItem = PieChartDataEntry(value: 0)
    var dataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let masterController = self.tabBarController as? TabbarMasterViewController else {
            return
        }
        self.user = masterController.user
        setupUI()
    }
    
    func setupUI() {
        guard let user = user else {
            return
        }
        pieChartView.backgroundColor = UIColor.gray
        let budgetDict = user.budgetItems
        
        foodItem.label = "Food"
        foodItem.value = budgetDict[BudgetItemName.Food]?.expectedAmount ?? 0.0
        foodAmountTextField.text = String(foodItem.value)
        if foodItem.value != 0.0 {
            dataEntries.append(foodItem)
        }
        
        housingItem.label = "Housing"
        housingItem.value = budgetDict[BudgetItemName.Housing]?.expectedAmount ?? 0.0
        housingAmountTextField.text = String(housingItem.value)
        if housingItem.value != 0.0 {
            dataEntries.append(housingItem)
        }

        transportationItem.label = "Transportation"
        transportationItem.value = budgetDict[BudgetItemName.Transportation]?.expectedAmount ?? 0.0
        transportationAmountTextField.text = String(transportationItem.value)
        if transportationItem.value != 0.0 {
            dataEntries.append(transportationItem)
        }

        savingsItem.label = "Savings"
        savingsItem.value = budgetDict[BudgetItemName.Savings]?.expectedAmount ?? 0.0
        savingsAmountTextField.text = String(savingsItem.value)
        if savingsItem.value != 0.0 {
            dataEntries.append(savingsItem)
        }

        otherItem.label = "Other"
        otherItem.value = budgetDict[BudgetItemName.Other]?.expectedAmount ?? 0.0
        otherAmountTextField.text = String(otherItem.value)
        if otherItem.value != 0.0 {
            dataEntries.append(otherItem)
        }
        
        updateChartData()
    }
    
    func updateChartData() {
        let chartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = [foodColor, housingColor, transportationColor, savingsColor, otherColor]
        chartDataSet.colors = colors
        pieChartView.data = chartData
    }
    
    
    @IBAction func viewChangesPressed(_ sender: Any) {
        //updateFields, update user info, post to db
        self.setEnableForTextFields(with: false)
        guard let foodValue = foodAmountTextField.getDoubleData(with: "Please enter a valid number"),
            let housingValue = housingAmountTextField.getDoubleData(with: "Please enter a valid number"),
            let transportationValue = transportationAmountTextField.getDoubleData(with: "Please enter a valid number"),
            let savingsValue = savingsAmountTextField.getDoubleData(with: "Please enter a valid number"),
            let otherValue = otherAmountTextField.getDoubleData(with: "Please enter a valid number") else {
                self.setEnableForTextFields(with: true)
                return
        }
        
        foodItem.value = foodValue
        housingItem.value = housingValue
        transportationItem.value = transportationValue
        savingsItem.value = savingsValue
        otherItem.value = otherValue
        updateChartData()
    }
    
    @IBAction func resetTextField(_ sender: UITextField) {
        sender.isEnabled = true
        sender.textColor = .black
        sender.text = ""
    }
    
    func setEnableForTextFields(with value: Bool) {
        foodAmountTextField.isEnabled = value
        housingAmountTextField.isEnabled = value
        transportationAmountTextField.isEnabled = value
        savingsAmountTextField.isEnabled = value
        otherAmountTextField.isEnabled = value
    }
}


