//
//  SLUserMD.swift
//  BigFactory
//
//  Created by huangqiang on 12/7/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit
import ObjectMapper

class SLUserMD: Mappable {
    var userId:String?
    var username:String?
    var password:String?
    var photoId:String?
    var personalSignature:String?
    var phone:String?
    var email:String?
    
    var createdBy:String?
    var lastUpdatedBy:String?
    var creationDate:NSDate?
    var lastUpdateDate:NSDate?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        userId <- map["userId"]
        username <- map["username"]
        password <- map["password"]
        photoId <- map["photoId"]
        password <- map["password"]
        personalSignature <- map["personalSignature"]
        phone <- map["phone"]
        email <- map["email"]
        
        createdBy <- map["createdBy"]
        lastUpdatedBy <- map["lastUpdatedBy"]
        
        creationDate <- (map["creationDate"],DateTransform())
        lastUpdateDate <- (map["lastUpdateDate"],DateTransform())
    }
}
