//
//  UINavigationItem_Extention.swift
//  BigFactory
//
//  Created by huangqiang on 12/8/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit

extension UINavigationItem{
    
    func fixedSpaceItem(spaceWidth:CGFloat)->UIBarButtonItem{
        let item:UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        item.width = spaceWidth;
        return item;
    }
    func iOS7FixedSpaceItem()->UIBarButtonItem{
        return fixedSpaceItem(-16)
    }
    func iOS6FixedSpaceItem()->UIBarButtonItem{
        return fixedSpaceItem(6)
    }
    
    func sl_setLeftBarButtonItem(leftBarButtonItem:UIBarButtonItem)
    {
        sl_setLeftBarButtonItems([leftBarButtonItem])
    }
    func sl_setRightBarButtonItem(rightBarButtonItem:UIBarButtonItem)
    {
        sl_setRightBarButtonItems([rightBarButtonItem])
    }
    func sl_setLeftBarButtonItems(leftBarButtonItems:NSArray)
    {
        if (leftBarButtonItems.count > 0) {
            let items:NSMutableArray = NSMutableArray.init(array: leftBarButtonItems)
            if(SystemVersion.SystemVersionGreatThanOrEqual(7)) {
                items.insertObject(iOS7FixedSpaceItem(), atIndex: 0)
            } else {
                items.insertObject(iOS6FixedSpaceItem(), atIndex: 0)
            }
            self.leftBarButtonItems = (NSArray.init(array: items) as! [UIBarButtonItem])
        } else {
            self.leftBarButtonItems = (leftBarButtonItems as! [UIBarButtonItem])
        }
    }
    
    func sl_setRightBarButtonItems(rightBarButtonItems:NSArray)
    {
        if (rightBarButtonItems.count > 0) {
            let items:NSMutableArray = NSMutableArray.init(array: rightBarButtonItems);
            if (SystemVersion.SystemVersionGreatThanOrEqual(7)) {
                items.insertObject(iOS7FixedSpaceItem(), atIndex: 0)
            } else {
                items.insertObject(iOS6FixedSpaceItem(), atIndex: 0)
            }
            self.rightBarButtonItems = (NSArray.init(array: items) as! [UIBarButtonItem])
        } else {
            self.rightBarButtonItems = (rightBarButtonItems as! [UIBarButtonItem])
        }
    }
}
