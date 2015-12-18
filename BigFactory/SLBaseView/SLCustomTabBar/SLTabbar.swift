//
//  SLTabbar.swift
//  BigLaugh
//
//  Created by huangqiang on 9/18/15.
//  Copyright © 2015 KEDOUINC. All rights reserved.
//

import UIKit

class SLTabbar: UITabBar {

    var customTabBarItems:NSMutableArray
    var topTabbarLine:UIImageView
    var musicIcon:UIImageView
    
    override init(frame: CGRect) {
        
        self.customTabBarItems = NSMutableArray.init(capacity: 2)
        self.topTabbarLine = UIImageView()
        self.musicIcon = UIImageView()
        
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
