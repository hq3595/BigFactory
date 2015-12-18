//
//  SLRefreshTableViewController.swift
//  BigFactory
//
//  Created by huangqiang on 12/8/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit
import Refresher
import Gifu

class SLRefreshTableViewController: SLTableViewController {
    
    private var loaddingMoreView:SLLoaddingMoreView!
    private var activityView:UIActivityIndicatorView!
    private var refreshHeaderView = SLRefreshHeaderView(frame: CGRectMake(0, 0, 320, 60))
    private var tableViewLastPosition:CGFloat = 0
    
    private var hasNoDataToGet = false
    private var isRefreshing :Bool = false{
        willSet(trueOrFalse){
            if(self.canPullToRefreshData){
                if(trueOrFalse){
                    self.showTable.addPullToRefreshWithAction({ () -> () in
                        self.firstRefreshData()
                        }, withAnimator: refreshHeaderView)
                }else{
                    UIView.animateWithDuration(1.0) { () -> Void in
                        self.showTable.stopPullToRefresh()
                    }
                }
            }
        }
    }
    private var isLoadingMoreData = false
    
    var isFirstRefreshData = false
    var canPullToRefreshData : Bool = true
    var canDrageToLoadMoreData: Bool = true{
        didSet(trueOrFalse){
            if(trueOrFalse){
                self.loaddingMoreView = SLLoaddingMoreView.loadingMoreViewWithStyle(SLLoaddingMoreViewStyle.Default, scrollView: self.showTable)
            }else{
                self.loaddingMoreView = nil
            }
        }
    }
    
    //分页用，代表请求的当前页
    var nowPage = 1
    
    //MARK: View lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.canPullToRefreshData = true  //默认为true,可以在子类里面设置
        self.canDrageToLoadMoreData = true //默认为true, 可以在子类里面设置
        
        self.activityView = UIActivityIndicatorView.init(activityIndicatorStyle: .Gray)
        self.activityView.frame = CGRectMake(0, 0, 24, 24)
        self.activityView.backgroundColor = UIColor.clearColor()
        self.activityView.center = self.showTable.center
        self.activityView.hidesWhenStopped = true
        self.view.insertSubview(self.activityView, aboveSubview: self.showTable)
        self.showTable.addSubview(self.placeHolderView)
    }
    
    
    //MARK: firstRefreshData methods
    
    func firstRefreshData(){
        if(self.isRefreshing == true){
            return
        }
        if(self.dataSource.count == 0){
            self.activityView.startAnimating()
        }
        self.hasNoDataToGet = false
        self.isRefreshing = true
        self.isFirstRefreshData = true
        self.nowPage = 1
    }
    
    func firstRefreshDataSuccess(result:SLAPIResult){
        self.activityView.stopAnimating()
        self.isRefreshing = false
        if(self.dataSource.count > 0){
            self.dataSource.removeAllObjects()
        }
        if(result.results?.count > 0){
            self.dataSource.addObjectsFromArray(result.results as! [AnyObject])
            self.placeHolderView.hidden = true
        }else{
            self.placeHolderView.hidden = false
            self.placeHolderView.height(placeholderViewHeight())
            self.placeHolderView.setPlaceholderWithType(placeHolderType())
        }
        self.showTable.reloadData()
    }
    
    func firstRefreshDataFailed(result:SLAPIResult){
        self.activityView.stopAnimating()
        self.isRefreshing = false
        if(self.dataSource.count == 0){
            self.placeHolderView.hidden = false
            self.placeHolderView.height(placeholderViewHeight())
            self.placeHolderView.setPlaceholderWithType(SLPlaceHolderViewType.Error)
        }else{
            self.placeHolderView.hidden = true
        }
        if( result.errorCode != nil ){
            NSLog("\(result.errorCode)")
        }
        self.showTable.reloadData()
    }
    
    //MARK: loadMoreData methods
    
    func loadMoreData(){
        loaddingMoreViewWith(true, noMoreTip: "拼命在给你加载笑料中...", showActivityView: true)
        if(self.isLoadingMoreData == true){
            return
        }
        self.isLoadingMoreData = true
        self.isFirstRefreshData = false
        self.nowPage = self.nowPage + 1
    }
    
    func loadMoreDataSuccess(result:SLAPIResult){
        self.isLoadingMoreData = false
        if(result.results?.count > 0){
            loaddingMoreViewWith(false, noMoreTip: "", showActivityView: false)
            self.dataSource.addObjectsFromArray(result.results as! [AnyObject])
            self.showTable.reloadData()
        }else{
            self.nowPage = self.nowPage - 1
            self.hasNoDataToGet = true
            loaddingMoreViewWith(true, noMoreTip: "据说，笑多了会怀孕哦，所以今天先笑到这儿吧...", showActivityView: false)
        }
        self.performSelector(Selector("changeHasNodataToGetStatusToFalse"), withObject: nil, afterDelay: 1.0)
    }
    
    func loadMoreDataFailed(result:SLAPIResult){
        self.nowPage = self.nowPage - 1
        self.hasNoDataToGet = true
        self.isLoadingMoreData = false
        loaddingMoreViewWith(true, noMoreTip: "竟然加载失败了，要不再往上拉拉试一下...", showActivityView: false)
        if( result.errorCode != nil ){
            NSLog("\(result.errorCode)")
        }
        self.performSelector(Selector("changeHasNodataToGetStatusToFalse"), withObject: nil, afterDelay: 1.0)
    }
    
    func changeHasNodataToGetStatusToFalse(){
        self.hasNoDataToGet = false
    }
    
    func loaddingMoreViewWith(showLoaddingView:Bool,noMoreTip:String,showActivityView:Bool){
        if(showLoaddingView){
            self.showTable.tableFooterView = self.loaddingMoreView
        }else{
            self.showTable.tableFooterView = nil
        }
        self.loaddingMoreView.showLoading(showLoaddingView, noMoreTip: noMoreTip, showActivityView: showActivityView)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if(scrollView == self.showTable){
            let  currentPostion = scrollView.contentOffset.y;
            var isScrollUp = false
            if (currentPostion - self.tableViewLastPosition > 20  && currentPostion > 0) {
                self.tableViewLastPosition = currentPostion;
                isScrollUp = true
            }else{
                isScrollUp = false
            }
            let y:CGFloat = scrollView.contentOffset.y + scrollView.bounds.size.height - scrollView.contentInset.bottom;
            let h:CGFloat = scrollView.contentSize.height;
            let reload_distance:CGFloat = 100
            if ( y > (h - reload_distance) && h >= self.view.height() && !self.isLoadingMoreData  && !self.hasNoDataToGet && self.canDrageToLoadMoreData && isScrollUp) {
                log.info("GET MORE DATA");
                loadMoreData()
            }
        }
    }
    
    override func placeHolderType() -> SLPlaceHolderViewType {
        return  SLPlaceHolderViewType.Default
    }
    
    override func placeholderViewHeight() -> CGFloat {
        return self.showTable.height()
    }
    
}
