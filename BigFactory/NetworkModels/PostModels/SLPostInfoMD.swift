//
//  SLPostInfoMD.swift
//  BigFactory
//
//  Created by huangqiang on 12/7/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit
import ObjectMapper

enum BgPostType:NSInteger{
    case Text = 1
    case Picture = 2
    case Gif = 3
}

enum BgPostCategoryType:NSInteger{
    case Cat = 1
    case Dog = 2
    case Human = 3
    case Girl = 4
}

class SLPostInfoMD : Mappable  {
    var postId:String?
    var postTitle:String?
    var postType:BgPostType?
    var postUrl:String?
    var categoryType:BgPostCategoryType?
    var user:SLUserMD?
    
    var createdBy:String?
    var lastUpdatedBy:String?
    var creationDate:NSDate?
    var lastUpdateDate:NSDate?
    
    required  init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        postId <- map["postId"]
        postTitle <- map["postTitle"]
        
        postType <- map["postType"]
        postUrl <- map["postUrl"]
        
        categoryType <- map["categoryType"]
        user <- map["user"]
        
        createdBy <- map["createdBy"]
        lastUpdatedBy <- map["lastUpdatedBy"]
        
        creationDate <- (map["creationDate"],DateTransform())
        lastUpdateDate <- (map["lastUpdateDate"],DateTransform())
    }
    
    
}
