//
//  SLRefreshHeaderView.swift
//  BigFactory
//
//  Created by huangqiang on 12/10/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import Foundation
import Refresher
import QuartzCore
import UIKit


class SLRefreshHeaderView: UIView , PullToRefreshViewDelegate{

    private let layerLoader = CAShapeLayer()
    private let layerSeparator = CAShapeLayer()
    
    private var labelTitle = UILabel()
    private var loadAI:UIActivityIndicatorView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layerLoader.lineWidth = 4
        layerLoader.strokeColor = UIColor(red: 0.13, green: 0.79, blue: 0.31, alpha: 1).CGColor
        layerLoader.strokeEnd = 0
        
        layerSeparator.lineWidth = 1
        layerSeparator.strokeColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1).CGColor
        
        labelTitle.frame = CGRectMake(0, 0, ScreenWidth, SLFont.sl_S4().lineHeight)
        labelTitle.font = SLFont.sl_S4()
        labelTitle.centerY(self.centerY())
        labelTitle.textColor = SLColor.sl_subcontent_color()
        labelTitle.textAlignment = .Center
        self.addSubview(labelTitle)
        
        self.loadAI = UIActivityIndicatorView.init(activityIndicatorStyle: .Gray)
        self.loadAI?.frame = CGRectMake(0, 0, 12, 12)
        self.loadAI?.backgroundColor = UIColor.clearColor()
        self.loadAI?.center = CGPointMake(labelTitle.centerX(), self.centerY())
        self.loadAI?.hidesWhenStopped = true
        self.addSubview(self.loadAI!)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pullToRefresh(view: PullToRefreshView, progressDidChange progress: CGFloat) {
        layerLoader.strokeEnd = progress
    }
    
    func pullToRefresh(view: PullToRefreshView, stateDidChange state: PullToRefreshViewState) {
        switch state {
        case .Loading:
            labelTitle.hidden = true
            loadAI?.startAnimating()
        case .PullToRefresh:
            labelTitle.text = "下拉刷新"
            labelTitle.hidden = false
            loadAI?.stopAnimating()
        case .ReleaseToRefresh:
            labelTitle.text = "释放刷新"
            labelTitle.hidden = false
            loadAI?.stopAnimating()
        }
    }
    
    func pullToRefreshAnimationDidEnd(view: PullToRefreshView) {
        layerLoader.removeAllAnimations()
        UIView.animateWithDuration(1.0) { () -> Void in
            self.loadAI?.stopAnimating()
            self.labelTitle.hidden = false
            self.labelTitle.text = ""
        }
    }
    
    func pullToRefreshAnimationDidStart(view: PullToRefreshView) {
        
        let pathAnimationEnd = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimationEnd.duration = 0.5
        pathAnimationEnd.repeatCount = 100
        pathAnimationEnd.autoreverses = true
        pathAnimationEnd.fromValue = 1
        pathAnimationEnd.toValue = 0.8
        layerLoader.addAnimation(pathAnimationEnd, forKey: "strokeEndAnimation")
        
        let pathAnimationStart = CABasicAnimation(keyPath: "strokeStart")
        pathAnimationStart.duration = 0.5
        pathAnimationStart.repeatCount = 100
        pathAnimationStart.autoreverses = true
        pathAnimationStart.fromValue = 0
        pathAnimationStart.toValue = 0.2
        layerLoader.addAnimation(pathAnimationStart, forKey: "strokeStartAnimation")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let superview = superview {
            if layerLoader.superlayer == nil {
                superview.layer.addSublayer(layerLoader)
            }
            if layerSeparator.superlayer == nil {
                superview.layer.addSublayer(layerSeparator)
            }
            let bezierPathLoader = UIBezierPath()
            bezierPathLoader.moveToPoint(CGPointMake(0, superview.frame.height - 3))
            bezierPathLoader.addLineToPoint(CGPoint(x: superview.frame.width, y: superview.frame.height - 3))
            
            let bezierPathSeparator = UIBezierPath()
            bezierPathSeparator.moveToPoint(CGPointMake(0, superview.frame.height - 1))
            bezierPathSeparator.addLineToPoint(CGPoint(x: superview.frame.width, y: superview.frame.height - 1))
            
            layerLoader.path = bezierPathLoader.CGPath
            layerSeparator.path = bezierPathSeparator.CGPath
        }
    }
}
