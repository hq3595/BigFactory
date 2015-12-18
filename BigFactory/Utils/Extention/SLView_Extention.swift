//
//  SLView_Extention.swift
//  BigFactory
//
//  Created by huangqiang on 12/8/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit

extension UIView{
    func x()->CGFloat{
        return CGRectGetMinX(self.frame)
    }
    func x(x:CGFloat){
        if(isnan(x)){return}
        let frame:CGRect = CGRectMake(x, CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))
        self.frame = frame
    }
    func y()->CGFloat
    {
        return CGRectGetMinY(self.frame);
    }
    func y(y:CGFloat)
    {
        if (isnan(y)) {
            return;
        }
        let frame:CGRect = CGRectMake(CGRectGetMinX(self.frame),y,CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        self.frame = frame;
    }
    func height()->CGFloat{
        return CGRectGetHeight(self.frame)
    }
    func height(height:CGFloat){
        if (isnan(height)) {
            return;
        }
        let frame:CGRect = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), height);
        self.frame = frame;
    }
    func width()->CGFloat{
        return CGRectGetWidth(self.frame);
    }
    func width(width:CGFloat)
    {
        if (isnan(width)) {
            return;
        }
        let frame:CGRect = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), width, CGRectGetHeight(self.frame));
        self.frame = frame;
    }
    
    func left()->CGFloat
    {
        return self.x()
    }
    
    func left(left:CGFloat)
    {
        self.x(left)
    }
    
    func top()->CGFloat
    {
        return self.y()
    }
    
    func top(top:CGFloat)
    {
        self.y(top)
    }
    
    func right()->CGFloat
    {
        return CGRectGetMinX(self.frame) + CGRectGetWidth(self.frame);
    }
    func right(right:CGFloat)
    {
        if (isnan(right)) {
            return;
        }
        var frame:CGRect = self.frame;
        frame.origin.x = CGFloat(ceilf(Float(right - frame.size.width)));
        self.frame = frame;
    }
    
    func bottom()->CGFloat
    {
        return CGRectGetMinY(self.frame) + CGRectGetHeight(self.frame);
    }
    
    func bottom(bottom:CGFloat)
    {
        if (isnan(bottom)) {
            return;
        }
        var frame:CGRect = self.frame;
        frame.origin.y = CGFloat(ceilf(Float(bottom - frame.size.height)));
        self.frame = frame;
    }
    
    func origin()->CGPoint
    {
        return self.frame.origin;
    }
    
    func origin(origin:CGPoint)
    {
        var frame:CGRect = self.frame;
        frame.origin = origin;
        self.frame = frame;
    }
    
    func size()->CGSize
    {
        return self.frame.size;
    }
    
    func size(size:CGSize)
    {
        var frame:CGRect = self.frame;
        frame.size = size;
        self.frame = frame;
    }
    
    func centerX()->CGFloat {
        return self.center.x;
    }
    
    func centerX(centerX:CGFloat) {
        if (isnan(centerX)) {
            return;
        }
        self.center = CGPointMake(centerX, self.center.y);
    }
    
    func centerY()->CGFloat {
        return self.center.y;
    }
    
    func centerY(centerY:CGFloat) {
        if (isnan(centerY)) {
            return;
        }
        self.center = CGPointMake(self.center.x, centerY);
    }
}