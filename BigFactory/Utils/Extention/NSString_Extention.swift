//
//  NSString_Extention.swift
//  BigFactory
//
//  Created by huangqiang on 12/8/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit

extension NSString{
    
    func urldecode()->String{
        return self.stringByRemovingPercentEncoding!
    }
    
    func containsString(inputString:String,options:NSStringCompareOptions)->Bool{
        let range:NSRange = self.rangeOfString(inputString , options: options)
        return range.location != NSNotFound
    }
    
    func comtainsString(inputString:String)->Bool{
        return containsString(inputString, options: NSStringCompareOptions.init(rawValue: 0))
    }
    
    static func getUnicodeString(str:NSString) ->String
    {
        let res:NSMutableString = NSMutableString.init()
        for i in 0...str.length{
            res.appendFormat("\\u%04x", str.characterAtIndex(i))
        }
        return res.copy() as! String;
    }
    
    //计算字符串大小
    static func getStringSizeWithString(text:NSString,font:UIFont,sizeMake:CGSize) -> CGRect{
        let attribute:NSDictionary = [NSFontAttributeName:font]
        let option = NSStringDrawingOptions.UsesLineFragmentOrigin
        let rect:CGRect = text.boundingRectWithSize(sizeMake, options: option, attributes: attribute as? [String : AnyObject], context: nil)
        return rect
    }
    
    
    static func intervalSinceNowWithLongLong(milliseconds:Double) -> String{
        
        let nowDate:NSDate = NSDate.init(timeIntervalSinceNow: 0)
        let nowTime:NSTimeInterval = nowDate.timeIntervalSince1970 * 1
        let publishTime:NSTimeInterval = milliseconds / 10000.0
        let spacingTime:NSTimeInterval = nowTime - publishTime
        var timeString = ""
        
        if(spacingTime < 10){
            timeString = "刚刚"
        }else if(spacingTime >= 10 && spacingTime < 60){
            timeString = String(spacingTime) + "秒前"
        }else if(spacingTime > 60 && spacingTime < 3600){
            timeString = String(spacingTime / 60) + "分钟前"
        }else if(spacingTime >= 3600 && spacingTime < 86400){
            timeString = String(spacingTime / 3600) + "小时前"
        }else if (spacingTime >= 86400 && spacingTime < 86400 * 7){
            timeString = String(spacingTime / 86400) + "天前"
        }else{
            let publishDate:NSDate = NSDate.init(timeInterval: -spacingTime, sinceDate: nowDate)
            let formatter:NSDateFormatter = NSDateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            var publishDateString:String = formatter.stringFromDate(publishDate)
            let publishYearString:String = publishDateString.substringToIndex(publishDateString.startIndex.advancedBy(4))
            let nowYearString:String = formatter.stringFromDate(nowDate).substringToIndex(formatter.stringFromDate(nowDate).startIndex.advancedBy(4))
            if(nowYearString == publishYearString){
                let index:String.Index = publishDateString.startIndex.advancedBy(5)
                publishDateString = publishDateString.substringFromIndex(index)
            }
            timeString = publishDateString
        }
        return timeString
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
