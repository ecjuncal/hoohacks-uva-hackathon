//
//  TabbarMasterViewController.swift
//  BudgetApp
//
//  Created by Chris Kozich on 3/29/20.
//  Copyright © 2020 Chris Kozich. All rights reserved.
//

import Foundation
import UIKit

class TabbarMasterViewController: UITabBarController {
    var user: User?
    
    func setUser(with user: User) {
        self.user = user
    }
}
