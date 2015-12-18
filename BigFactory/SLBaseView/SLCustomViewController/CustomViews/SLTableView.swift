//
//  SLTableView.swift
//  BigFactory
//
//  Created by huangqiang on 12/8/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit

class SLTableView: UITableView {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.backgroundColor = SLColor.sl_bg_color()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
