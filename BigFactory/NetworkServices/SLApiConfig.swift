//
//  SLApiConfig.swift
//  BigFactory
//
//  Created by huangqiang on 12/7/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit

class SLApiConfig: NSObject {
    
    static func serviceBaseURL() -> String{
        return SLApiConfig.webBaseURL() + SLApiConfig.apiPrefix()
    }
    
    static func webBaseURL() -> String{
        if (ONLINE_MODE) {
            if (PRE_RELEASE_MODE) {
                return "http://192.168.199.79:8080/"
            } else {
                return "http://7xoum6.com1.z0.glb.clouddn.com/"
            }
        }else{
            return "http://localhost:8080/"
        }
    }
    
    static func apiPrefix() -> String{
        if(PRE_RELEASE_MODE){
             return "HEMPlatform-service/rest/"
        }else{
            return "jsonData/"
        }
    }
}
