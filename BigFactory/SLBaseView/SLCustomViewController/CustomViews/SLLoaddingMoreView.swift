//
//  SLLoaddingMoreView.swift
//  BigFactory
//
//  Created by huangqiang on 12/8/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit

enum SLLoaddingMoreViewStyle:NSInteger{
    case Default
    case Another
}

class SLLoaddingMoreView: UIView {
    var scrollView = UIScrollView()
    var loadLabel = UILabel()
    var loadAI:UIActivityIndicatorView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubViews()
        self.backgroundColor = SLColor.sl_bg_color()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initSubViews(){
        
        self.loadLabel.frame = CGRectMake(0, 0, 256, 12)
        self.loadLabel.center = self.center
        self.loadLabel.text = "加载中..."
        self.loadLabel.font = SLFont.sl_S9()
        self.loadLabel.textColor = UIColor.lightGrayColor()
        self.backgroundColor = UIColor.clearColor()
        self.loadLabel.textAlignment = .Center
        self.addSubview(self.loadLabel)
        
        self.loadAI = UIActivityIndicatorView.init(activityIndicatorStyle: .Gray)
        self.loadAI?.frame = CGRectMake(90, 0, 12, 12)
        self.loadAI?.backgroundColor = UIColor.clearColor()
        self.loadAI?.center.y = self.centerY()
        self.loadAI?.hidesWhenStopped = true
        self.addSubview(self.loadAI!)
    }
    
    static func loadingMoreViewWithStyle(style:SLLoaddingMoreViewStyle,scrollView:UIScrollView)->SLLoaddingMoreView{
        let loadingMoreView:SLLoaddingMoreView = SLLoaddingMoreView.init(frame: CGRectMake(0, 0, ScreenWidth, 40))
        loadingMoreView.scrollView = scrollView
        return loadingMoreView
    }
    
    func showLoading(showLoaddingView:Bool,noMoreTip:String,showActivityView:Bool){
        if(showLoaddingView && showActivityView){
            self.loadAI?.startAnimating()
        }else{
            self.loadAI?.stopAnimating()
        }
        if(noMoreTip.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0){
            self.loadLabel.text = noMoreTip
        }
    }
    
}
