//
//  SLBaseService.swift
//  BigFactory
//
//  Created by huangqiang on 12/7/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import Alamofire
import ReachabilitySwift

class SLBaseService: NSObject {
    
    var alamoFireManager : Alamofire.Manager?
    var configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
    
    override init() {
        super.init()
        // 初始化网络请求设置，超时时间等
        //http://stackoverflow.com/questions/31095070/alamofire-does-not-respect-timeout-interval
        configuration.timeoutIntervalForRequest = 8
        configuration.timeoutIntervalForResource = 8
        
    }
    func sendHttpRequest(
        method: Alamofire.Method,
        _ path: String,
        parameters: [String: AnyObject]? = nil,
        encoding: ParameterEncoding = .URL,
        headers: [String: String]? = nil)
        -> Request
    {
        
        let cachePolicy: NSURLRequestCachePolicy = (reachability?.currentReachabilityStatus) == Reachability.NetworkStatus.NotReachable ? .ReturnCacheDataElseLoad : .ReloadIgnoringLocalCacheData
        configuration.requestCachePolicy = cachePolicy
        self.alamoFireManager = Alamofire.Manager(configuration: configuration)
        
        let requestURL = SLApiConfig.serviceBaseURL() + path
        
        let request:Request = self.alamoFireManager!.request(method, requestURL, parameters: parameters, encoding: encoding, headers: headers)
        request.responseObject { (response: Response<SLBaseResultMD, NSError>) -> Void in
            let resultMD = response.result.value
            //网络请求失败
            if(resultMD?.resultCode != .Success){
                log.info("error response:\(response.response) ----> :\(response.result)")
            }
        }
        return request
    }
        
}
