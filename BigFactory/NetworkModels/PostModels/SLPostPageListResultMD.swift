//
//  SLPostPageListResultMD.swift
//  BigFactory
//
//  Created by huangqiang on 12/7/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit
import ObjectMapper

class SLPostPageListResultMD: SLBaseResultMD {
    
    var pageData:[SLPostInfoMD]?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        pageData    <- map["pageData"]
    }
}
