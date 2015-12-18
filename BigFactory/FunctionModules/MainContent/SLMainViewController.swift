//
//  SLMainViewController.swift
//  BigLaugh
//
//  Created by huangqiang on 9/18/15.
//  Copyright © 2015 KEDOUINC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class SLMainViewController: SLRefreshTableViewController,SLPostCellDelegate {
    
    var postService  = SLPostService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleImgView = UIImageView()
        let titleImage = UIImage(named: "logoTest")
        titleImgView.frame = CGRectMake(0, 0, 92, 60/2)
        titleImgView.contentMode = UIViewContentMode.ScaleAspectFit
        titleImgView.image = titleImage
        self.navigationItem.titleView = titleImgView
        self.showTable.registerClass(SLPostCell.self, forCellReuseIdentifier: PostCellIdentify)
        firstRefreshData()
    }
    
    //MARK: network request
    override func firstRefreshData() {
        super.firstRefreshData()
        gotoRequestData()
    }
    
    override func loadMoreData() {
        super.loadMoreData()
        gotoRequestData()
    }
    
    func gotoRequestData(){
        postService.getPostListWith(["nowPage":String(self.nowPage)]).responseObject { (response: Response<SLPostPageListResultMD, NSError>) -> Void in
            let resultMD = response.result.value
            //成功
            if(resultMD?.resultCode == .Success){
                let temp:NSMutableArray = NSMutableArray.init(capacity: 5)
                for postInfo in (resultMD!.pageData)! {
                    let cellData:SLPostCellData = SLPostCellData()
                    cellData.postInfo = postInfo
                    temp.addObject(cellData as AnyObject)
                }
                let result = SLAPIResult()
                result.results = temp
                if(self.isFirstRefreshData){
//                    self.firstRefreshDataSuccess(result)
                    self.performSelector(Selector("firstRefreshDataSuccess:"), withObject: result, afterDelay: 3.0)
                }else{
//                    self.loadMoreDataSuccess(result)
                    self.performSelector(Selector("loadMoreDataSuccess:"), withObject: result, afterDelay: 3.0)
                }
            }else{
                //失败
                let statusCode = response.response?.statusCode
                let result = SLAPIResult()
                result.errorCode = statusCode
                if(self.isFirstRefreshData){
                    self.firstRefreshDataFailed(result)
                }else{
                    self.loadMoreDataFailed(result)
                }
            }
        }
    }
    
    //MARK: tableView delegat/datasource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellData = self.dataSource[indexPath.row]
        var cell = tableView.dequeueReusableCellWithIdentifier(PostCellIdentify, forIndexPath: indexPath) as? SLPostCell
        if(cell == nil){
            cell = SLPostCell.init(style: .Default, reuseIdentifier: PostCellIdentify)
        }
        cell?.delegate = self
        cell?.setUpCellData(cellData as! SLTableViewCellData)
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cellData = self.dataSource[indexPath.row] as! SLTableViewCellData
        return cellData.cellHeight + 5
    }
    
    //MARK: SLPostCellDelegate 
    
    func didClickedImageView(cell: SLPostCell, photoUrl: String, imageView: UIImageView) {
        let VC = SLPhotoViewerController()
        VC.photoUrl = photoUrl
        self.navigationController?.presentViewController(VC, animated: false, completion: { () -> Void in
            
        })
    }
    
    
}
