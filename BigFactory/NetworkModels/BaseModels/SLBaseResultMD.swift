//
//  SLBaseResultMD.swift
//  BigFactory
//
//  Created by huangqiang on 12/7/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit
import ObjectMapper

enum SLResultCode :String{
    case Success = "SUCCESS"
    case Failed = "FAILED"
}

class SLBaseResultMD : Mappable{
    
    var resultCode:SLResultCode?
    var devMsg:String?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        resultCode <- map["code"]
        devMsg <- map["devMsg"]
    }
}
