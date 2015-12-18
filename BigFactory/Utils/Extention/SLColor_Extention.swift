//
//  SLColor_Extention.swift
//  BigLaugh
//
//  Created by huangqiang on 9/21/15.
//  Copyright © 2015 KEDOUINC. All rights reserved.
//

import UIKit

extension UIColor{
    public convenience init(rgba: String) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        if rgba.hasPrefix("#") {
            let index   = rgba.startIndex.advancedBy(1)
            let hex     = rgba.substringFromIndex(index)
            let scanner = NSScanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            if scanner.scanHexLongLong(&hexValue) {
                switch (hex.characters.count) {
                case 3:
                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
                case 4:
                    red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                    green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                    blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                    alpha = CGFloat(hexValue & 0x000F)             / 15.0
                case 6:
                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                case 8:
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                default:
                    print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8")
                }
            } else {
                print("Scan hex error")
            }
        } else {
            print("Invalid RGB string, missing '#' as prefix")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

struct SLColor {
    
    static func sl_C1() ->UIColor{
        return UIColor.init(rgba: "#212324")
    }
    static func sl_C2() ->UIColor{
        return UIColor.init(rgba: "#444444")
    }
    
    static func sl_C3() ->UIColor{
        return UIColor.init(rgba: "#888888")
    }
    static func sl_C4() ->UIColor{
        return UIColor.init(rgba: "#999999")
    }
    
    static func sl_background() ->UIColor{
        return UIColor.init(rgba: "#eeeeee")
    }
    static func sl_seperateLine() ->UIColor{
        return UIColor.init(rgba: "#dddddd")
    }
    
    static func sl_cellbackground() ->UIColor{
        return UIColor.init(rgba: "#ffffff")
    }
    static func sl_avatar_no_content() ->UIColor{
        return UIColor.init(rgba: "#5a5a5a")
    }
    
    static func sl_timeTextColor() ->UIColor{
        return UIColor.init(rgba: "#b4b4b4")
    }
    static func sl_commentTextColor() ->UIColor{
        return UIColor.init(rgba: "#999999")
    }
    static func sl_personal_work_vertical_line_color() ->UIColor{
        return UIColor.init(rgba: "#dddddd")
    }
    static func sl_personal_work_corver_border_color() ->UIColor{
        return UIColor.init(rgba: "#eeeeee")
    }
    
    static func sl_record_bg_color() ->UIColor{
        return UIColor.init(rgba: "#121314")
    }
    static func sl_nav_and_tab_color() ->UIColor{
        return UIColor.init(rgba: "#f6f6f6")
    }
    static func sl_nav_page_title_color() ->UIColor{
        return UIColor.init(rgba: "#333333")
    }
    
    static func sl_discovery_bg_color() ->UIColor{
        return UIColor.init(rgba: "#b2b2b2")
    }
    static func sl_tab_seperator_color() ->UIColor{
        return UIColor.init(rgba: "#969a9b")
    }
    static func sl_subcontent_color() ->UIColor{
        return UIColor.init(rgba: "#9a9ea1")
    }
    
    static func sl_content_color() ->UIColor{
        return UIColor.init(rgba: "#484848")
    }
    static func sl_main_color() ->UIColor{
        return UIColor.init(rgba: "#8CBB44")
    }
    static func sl_decorator_color() ->UIColor{
        return UIColor.init(rgba: "#efa125")
    }
    
    static func sl_menuView_color() ->UIColor{
        return UIColor.init(rgba: "#24292c")
    }
    static func sl_normal_price_bgcolor() ->UIColor{
        return UIColor.init(rgba: "#ffba01")
    }
    static func sl_tag_creater_color() ->UIColor{
        return UIColor.init(rgba: "#799bb8")
    }
    
    static func sl_tag_creatTime_color() ->UIColor{
        return UIColor.init(rgba: "#cfd1d3")
    }
    static func sl_avatar_user_color() ->UIColor{
        return UIColor.init(rgba: "#5b8fb5")
    }
    static func sl_personalCenter_title_color() ->UIColor{
        return UIColor.init(rgba: "#363636")
    }
    
    static func sl_cell_seperator_color() ->UIColor{
        return UIColor.init(rgba: "#eeeeee")
    }
    
    static func sl_post_title_color() ->UIColor{
        return UIColor.init(rgba: "#464646")
    }
    static func sl_nav_top_color() ->UIColor{
        return UIColor.init(rgba: "#ffda44")
    }
    static func sl_c5c6c7_color() ->UIColor{
        return UIColor.init(rgba: "#c5c6c7")
    }
    
    static func sl_C5_3() ->UIColor{
        return UIColor.init(rgba: "#e6e6e6")
    }
    
    static func sl_bg_color() ->UIColor{
        return UIColor.init(rgba: "#eeeeee")
    }
    
    static func sl_random_color() ->UIColor{
        let randomColorStringArray = ["#44BB74","#8CBB44","#669971","#66AA55","#5CBB44","#3CC472"];
        //取0到x-1的随机数
        let count = UInt32(randomColorStringArray.count)
        let value = Int(arc4random_uniform(count))
        let hexString = randomColorStringArray[value]
        return UIColor.init(rgba: hexString)
    }
    
    static func allStudents() -> UIColor {
        return UIColor.init(rgba: "#c5c6c7")
    }
}
