//
//  BarChartViewController.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/29/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation
import UIKit
import Charts

class BarChartViewController: UIViewController {
    
    @IBOutlet var barChartView: BarChartView!
    private let actualColor = UIColor.red
    private let expectedColor = UIColor.green
    var user: User?
    var barFoodDataEntries = [BarChartDataEntry]()
    var barHousingDataEntries = [BarChartDataEntry]()
    var barTransportationDataEntries = [BarChartDataEntry]()
    var barSavingsDataEntries = [BarChartDataEntry]()
    var barOtherDataEntries = [BarChartDataEntry]()
    
    var expectedFoodAmount = BarChartDataEntry(x: 0, y: 0)
    var actualFoodAmount = BarChartDataEntry(x: 1, y: 0)
    
    var expectedHousingAmount = BarChartDataEntry(x: 3, y: 0)
    var actualHousingAmount = BarChartDataEntry(x: 4, y: 0)
    
    var expectedTransportationAmount = BarChartDataEntry(x: 6, y: 0)
    var actualTransportationAmount = BarChartDataEntry(x: 7, y: 0)
    
    var expectedSavingsAmount = BarChartDataEntry(x: 9, y: 0)
    var actualSavingsAmount = BarChartDataEntry(x: 10, y: 0)
    
    var expectedOtherAmount = BarChartDataEntry(x: 12, y: 0)
    var actualOtherAmount = BarChartDataEntry(x: 13, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.barChartView.backgroundColor = UIColor.gray
        guard let masterView = self.tabBarController as? TabbarMasterViewController else {
            return
        }
        
        self.user = masterView.user
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUI()
    }
    
    func setupUI() {
        updateBarChartDataEntries()
        updateBarChartData()
    }
    
    func updateBarChartDataEntries() {
        guard let user = self.user else {
            return
        }
        
        expectedFoodAmount = BarChartDataEntry(x: 0, y: user.budgetItems[BudgetItemName.Food]?.expectedAmount ?? 0.0)
        actualFoodAmount = BarChartDataEntry(x: 1, y: user.budgetItems[BudgetItemName.Food]?.actualAmount ?? 0.0)
        barFoodDataEntries.append(expectedFoodAmount)
        barFoodDataEntries.append(actualFoodAmount)
           
        expectedHousingAmount = BarChartDataEntry(x: 3, y:
            user.budgetItems[BudgetItemName.Housing]?.expectedAmount ?? 0.0)
        actualHousingAmount = BarChartDataEntry(x: 4, y: user.budgetItems[BudgetItemName.Housing]?.actualAmount ?? 0.0)
        barHousingDataEntries.append(expectedHousingAmount)
        barHousingDataEntries.append(actualHousingAmount)

        expectedTransportationAmount = BarChartDataEntry(x: 6, y:
            user.budgetItems[BudgetItemName.Transportation]?.expectedAmount ?? 0.0)
        actualTransportationAmount = BarChartDataEntry(x: 7, y:  user.budgetItems[BudgetItemName.Transportation]?.actualAmount ?? 0.0)
        barTransportationDataEntries.append(expectedTransportationAmount)
        barTransportationDataEntries.append(actualTransportationAmount)
           
        expectedSavingsAmount = BarChartDataEntry(x: 9, y:  user.budgetItems[BudgetItemName.Savings]?.expectedAmount ?? 0.0)
        actualSavingsAmount = BarChartDataEntry(x: 10, y:  user.budgetItems[BudgetItemName.Savings]?.actualAmount ?? 0.0)
        barSavingsDataEntries.append(expectedSavingsAmount)
        barSavingsDataEntries.append(actualSavingsAmount)
           
        expectedOtherAmount = BarChartDataEntry(x: 12, y:  user.budgetItems[BudgetItemName.Other]?.expectedAmount ?? 0.0)
        actualOtherAmount = BarChartDataEntry(x: 13, y:  user.budgetItems[BudgetItemName.Other]?.actualAmount ?? 0.0)
        barOtherDataEntries.append(expectedOtherAmount)
        barOtherDataEntries.append(actualOtherAmount)
    }
    
    func updateBarChartData() {
        let chartFoodDataSet = BarChartDataSet(entries: barFoodDataEntries, label: "Food")
        chartFoodDataSet.colors = [expectedColor, actualColor]
        
        let chartHousingDataSet = BarChartDataSet(entries: barHousingDataEntries, label: "Housing")
        chartHousingDataSet.colors = [expectedColor, actualColor]

        let chartTransportationDataSet = BarChartDataSet(entries: barTransportationDataEntries, label: "Transportation")
        chartTransportationDataSet.colors = [expectedColor, actualColor]

        let chartSavingsDataSet = BarChartDataSet(entries: barSavingsDataEntries, label: "Savings")
        chartSavingsDataSet.colors = [expectedColor, actualColor]

        let chartOtherDataSet = BarChartDataSet(entries: barOtherDataEntries, label: "Other")
        chartOtherDataSet.colors = [expectedColor, actualColor]

        let allChartDataSets = [chartFoodDataSet, chartHousingDataSet, chartTransportationDataSet, chartSavingsDataSet, chartOtherDataSet]
        
        
        let chartData = BarChartData(dataSets: allChartDataSets)
        barChartView.data = chartData
    }
}
