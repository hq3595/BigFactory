//
//  UIImageView_Line.swift
//  BigFactory
//
//  Created by huangqiang on 12/8/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit

extension UIImageView{
    static func sl_L1_width(width:CGFloat)->UIImageView{
        let line_height:CGFloat = 1
        let line:UIImageView = UIImageView.init(frame: CGRectMake(0, 0, width, line_height))
        line.backgroundColor = SLColor.sl_C5_3()
        return line
    }
    
    static func sl_seperateLineWidth(width:CGFloat)->UIImageView{
        let line_height:CGFloat = 0.5
        let line:UIImageView = UIImageView.init(frame: CGRectMake(0, 0, width, line_height))
        line.backgroundColor = SLColor.sl_cell_seperator_color()
        return line
    }
}
