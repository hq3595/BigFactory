//
//  SLGlobalConst.swift
//  BigFactory
//
//  Created by huangqiang on 12/7/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit

//线上和测试环境切换
let  ONLINE_MODE =  true
//预发和线上环境
let PRE_RELEASE_MODE = (ONLINE_MODE && false)

let ScreenHeight = UIScreen.mainScreen().bounds.size.height
let ScreenWidth = UIScreen.mainScreen().bounds.size.width
let StateBarHeight:CGFloat = 20
let HeaderHeight:CGFloat = 44

//system version preprocess
struct SystemVersion {
    static func SystemVersionGreatThanOrEqual(version:Int)->Bool{
        return NSProcessInfo().isOperatingSystemAtLeastVersion(NSOperatingSystemVersion(majorVersion: version, minorVersion: 0, patchVersion: 0))
    }
    static func SystemVersionLessThan(version:Int)->Bool{
        return !SystemVersionGreatThanOrEqual(version)
    }
}
//默认文本内容字体大小
let kContentTextFont = SLFont.sl_S5()

class SLGlobalConst: NSObject {
    
}
