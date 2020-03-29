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
        setupUI()
    }
    
    func setupUI() {
        guard let user = user else {
            return
        }
        pieChartView.backgroundColor = UIColor.gray
        let budgetDict = user.budgetItems
        
        foodItem.label = "Food"
        foodItem.value = budgetDict[BudgetItemName.Food] ?? 0.0
        foodAmountTextField.text = String(foodItem.value)
        if foodItem.value != 0.0 {
            dataEntries.append(foodItem)
        }
        
        housingItem.label = "Housing"
        housingItem.value = budgetDict[BudgetItemName.Housing] ?? 0.0
        housingAmountTextField.text = String(housingItem.value)
        if housingItem.value != 0.0 {
            dataEntries.append(housingItem)
        }

        transportationItem.label = "Transportation"
        transportationItem.value = budgetDict[BudgetItemName.Transportation] ?? 0.0
        transportationAmountTextField.text = String(transportationItem.value)
        if transportationItem.value != 0.0 {
            dataEntries.append(transportationItem)
        }

        savingsItem.label = "Savings"
        savingsItem.value = budgetDict[BudgetItemName.Savings] ?? 0.0
        savingsAmountTextField.text = String(savingsItem.value)
        if savingsItem.value != 0.0 {
            dataEntries.append(savingsItem)
        }

        otherItem.label = "Other"
        otherItem.value = budgetDict[BudgetItemName.Other] ?? 0.0
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
    }
}


