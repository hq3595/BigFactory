//
//  SLViewController.swift
//  BigLaugh
//
//  Created by huangqiang on 12/7/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit

class SLViewController: UIViewController {
    
    var titleLabel = UILabel()
    var singleTapGR = UITapGestureRecognizer()
    var placeHolderView = SLPlaceHolderView(frame: CGRectMake(0, 0, ScreenWidth, ScreenWidth))
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(SystemVersion.SystemVersionGreatThanOrEqual(7)){
            self.edgesForExtendedLayout = UIRectEdge.None
            self.extendedLayoutIncludesOpaqueBars = false
            self.automaticallyAdjustsScrollViewInsets = false
            self.navigationController?.navigationBar.barTintColor = SLColor.sl_main_color()
        }
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = SLColor.sl_bg_color()
        self.titleLabel.frame = CGRectMake(0, 0, ScreenWidth - 220, HeaderHeight)
        self.titleLabel.textAlignment = .Center
        self.titleLabel.font = SLFont.sl_S3()
        self.titleLabel.backgroundColor = UIColor.clearColor()
        self.titleLabel.text = self.title
        self.titleLabel.textColor = UIColor.whiteColor()
        self.titleLabel.lineBreakMode = .ByTruncatingTail
        self.navigationItem.titleView?.frame = CGRectMake(0, 0, ScreenWidth - 220, HeaderHeight)
        self.navigationItem.titleView = self.titleLabel
        
        self.singleTapGR = UITapGestureRecognizer.init(target: self, action: Selector("tapAnywhereToDismissKeyboard:"))
        self.singleTapGR.numberOfTapsRequired = 1
        self.singleTapGR.numberOfTouchesRequired = 1
        
        if(self.navigationController != nil){
            self.navigationController?.navigationBar.translucent = false
        }
    }
    
    deinit{
        log.info("deinit controller")
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func setUpForDismissKeyboard(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func placeholderViewHeight()->CGFloat{
        return self.view.height()
    }
    
    func placeHolderType()->SLPlaceHolderViewType{
        return SLPlaceHolderViewType.Default
    }
    
    
    func keyboardWillShow(notification:NSNotification){
        self.view.addGestureRecognizer(self.singleTapGR)
    }
    
    func keyboardWillHide(notification:NSNotification){
        self.view.removeGestureRecognizer(self.singleTapGR)
    }
    
    func tapAnywhereToDismissKeyboard(gestureRecognizer:UIGestureRecognizer){
        self.view.endEditing(true)
    }
}
