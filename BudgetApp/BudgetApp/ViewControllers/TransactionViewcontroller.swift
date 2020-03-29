//
//  TransactionViewController.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/29/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation
import UIKit

class TransactionViewController: UIViewController {
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let masterView = self.tabBarController as? TabbarMasterViewController else {
            return
        }
        
        self.user = masterView.user
    }
}
