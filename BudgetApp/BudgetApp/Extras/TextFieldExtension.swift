//
//  TextViewExtension.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/29/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func getPhoneData(with error: String) -> Int? {
        guard let value = self.text else {
            self.textColor = .red
            self.text = error
            return nil
        }
        
        if value.count != 10 {
            self.textColor = .red
            self.text = error
            return nil
        }
        
        guard let intVal = Int(value) else {
            self.textColor = .red
            self.text = error
            return nil
        }
        return intVal
    }
    
    func getDoubleData(with error: String) -> Double? {
        guard let value = self.text else {
            self.textColor = .red
            self.text = error
            return nil
        }
        
        guard let doubleVal = Double(value) else {
            self.textColor = .red
            self.text = error
            return nil
        }
        
        return doubleVal
    }
    
    func checkEmptySubmission(with error: String) -> String? {
        guard let value = self.text else {
            self.textColor = .red
            self.text = error
            return nil
        }
        
        if value.isEmpty {
            self.textColor = .red
            self.text = error
            return nil
        }
        
        return value
    }
}
