//
//  SLPhotoViewerController.swift
//  BigFactory
//
//  Created by huangqiang on 12/12/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit
import Kingfisher

class SLPhotoViewerController: SLViewController {
    
    let imageView = UIImageView()
    let doneButton = UIButton()
    var photoUrl = "" 

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        
        self.view.userInteractionEnabled = true
        let gesture = UITapGestureRecognizer.init(target: self, action: Selector("shouldDismissCurrentView"))
        self.view.addGestureRecognizer(gesture)
        
        // Do any additional setup after loading the view.
        imageView.contentMode = .ScaleAspectFit
        imageView.frame = self.view.frame
        imageView.center = self.view.center
        imageView.kf_showIndicatorWhenLoading = true
        imageView.kf_setImageWithURL(NSURL(string: photoUrl)!,
            placeholderImage: nil,
            optionsInfo: [.TargetCache(imageCache)])
        self.view.addSubview(imageView)
        
        doneButton.frame = CGRectMake(ScreenWidth - 60, ScreenHeight - 45, 40, 20)
        doneButton.setTitle("完成", forState: UIControlState.Normal)
        doneButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        doneButton.addTarget(self, action: Selector("shouldDismissCurrentView"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(doneButton)
    }
    
    deinit{
        log.info("deinit controller")
    }
    
    func shouldDismissCurrentView(){
        self.dismissViewControllerAnimated(false) { () -> Void in
            
        }
    }
}
