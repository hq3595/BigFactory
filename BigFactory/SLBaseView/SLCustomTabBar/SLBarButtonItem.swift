//
//  SLBarButtonItem.swift
//  BigLaugh
//
//  Created by huangqiang on 9/21/15.
//  Copyright © 2015 KEDOUINC. All rights reserved.
//

import UIKit

class SLBarButtonItem: UIBarButtonItem {
    
    init(image: UIImage?, style: UIBarButtonItemStyle, target: AnyObject?, action: Selector){
        super.init()
        self.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.whiteColor()], forState: UIControlState.Normal)
        self.image = image
        self.style = style
        self.target = target
        self.action = action
    }
    
    init(title: String?, style: UIBarButtonItemStyle, target: AnyObject?, action: Selector){
        super.init()
        self.title = title
        self.style = style
        self.target = target
        self.action = action
        self.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.whiteColor()], forState: UIControlState.Normal)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
