//
//  AppDelegate.swift
//  BigFactory
//
//  Created by huangqiang on 12/7/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func applicableTopWindow()->UIWindow{
        let topWindow:UIWindow = UIApplication.sharedApplication().windows.last!
        if(topWindow == self.window){
            return self.window!;
        }else{
            if(CGRectEqualToRect(topWindow.bounds, UIScreen.mainScreen().bounds)){
                return topWindow;
            }else{
                return self.window!;
            }
        }
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        SLApplicationInitUtil.sharedInstance.initApplicationSetting()
        
        let tabbarVC:SLTabbarController = SLTabbarController()
        //创建窗口
        self.window?.frame = UIScreen.mainScreen().bounds
        //创建根试图控制器
        self.window?.rootViewController = tabbarVC
        //显示窗口
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    

    
    
    
    
    
    
    
    

}

