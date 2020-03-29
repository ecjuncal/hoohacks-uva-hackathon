//
//  SwizardTextField.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/28/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation
import UIKit

class SwizardTextField: UITextField {
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.textColor = .black
        textField.text = ""
    }
}
