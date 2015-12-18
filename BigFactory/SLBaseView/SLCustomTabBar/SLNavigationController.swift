//
//  SLNavigationController.swift
//  BigLaugh
//
//  Created by huangqiang on 9/21/15.
//  Copyright © 2015 KEDOUINC. All rights reserved.
//

import UIKit

class SLNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = SLColor.sl_nav_and_tab_color()
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
    }
    
}
