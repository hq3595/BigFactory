//
//  SLTabbarController.swift
//  BigLaugh
//
//  Created by huangqiang on 9/18/15.
//  Copyright © 2015 KEDOUINC. All rights reserved.
//

import UIKit

class SLTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().barStyle = UIBarStyle.Black
        //创建子试图控制器
        
        let communityVC = SLMainViewController()
        let messageVC = SLMessageViewController()
        let profileVC = SLProfileViewController()
        
        let communityNav = addChildVC(communityVC, title: "段子中心", image: "in_normal", selectedImage: "in_highlight");
        let messageNav = addChildVC(messageVC, title: "消息", image: "discover_normal", selectedImage: "discover_highlight");
        let profileNav = addChildVC(profileVC, title: "个人中心", image: "my_normal", selectedImage: "my_highlight");

        self.addChildViewController(communityNav)
        self.addChildViewController(messageNav)
        self.addChildViewController(profileNav)
    }
    
    func addChildVC(childVC:UIViewController,title:String,image:String,selectedImage:String) ->SLNavigationController {
        
        childVC.title = title;
        childVC.tabBarItem.image = UIImage(named: image)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImage)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        self.addChildViewController(childVC)
        let selectedDic = NSDictionary(object: SLColor.sl_content_color(), forKey: NSForegroundColorAttributeName)
        childVC.tabBarItem.setTitleTextAttributes((selectedDic as! [String : AnyObject]), forState: UIControlState.Selected)
        
        let navigationController = SLNavigationController(rootViewController: childVC)
        
        return navigationController
        
    }

}
