//
//  SLPostService.swift
//  BigFactory
//
//  Created by huangqiang on 12/7/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import Alamofire

class SLPostService: NSObject {
    
    var baseService = SLBaseService()
    
    //根据参数获取帖子列表
//    func getPostListWith(parameters: Dictionary<String,AnyObject>) -> Request{
//        let path = "v1/posts/getList?nowPage=" + ((parameters["nowPage"]) as! String)
//        return baseService.sendHttpRequest(.GET, path, parameters: parameters , encoding: .URL, headers: nil)
//    }
    
    func getPostListWith(parameters: Dictionary<String,AnyObject>) -> Request{
        let path = "postListPage\(((parameters["nowPage"]) as! String)).json"
        return baseService.sendHttpRequest(.GET, path, parameters: parameters , encoding: .URL, headers: nil)
    }
}
