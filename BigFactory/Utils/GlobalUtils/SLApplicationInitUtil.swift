//
//  SLApplicationInitUtil.swift
//  BigFactory
//
//  Created by huangqiang on 12/11/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit
import ReachabilitySwift

let log = XCGLogger.defaultInstance()
var reachability: Reachability?
let hostName = "www.baidu.com"

class SLApplicationInitUtil:NSObject {
    
    static let sharedInstance = SLApplicationInitUtil()
    
    private override init() {
        super.init()
    }
    
    func initApplicationSetting(){
        
        //网络状态监听模块
        do {
            let rb = try Reachability.reachabilityForInternetConnection()
            reachability = rb
        } catch ReachabilityError.FailedToCreateWithAddress(let address) {
            log.info("FailedToCreateWithAddress \(address)")
            return
        } catch {}
        
        //Url缓存空间大小设置
        let urlCache:NSURLCache = NSURLCache.init(memoryCapacity: 20, diskCapacity: 100*1024*1024, diskPath: nil)
        NSURLCache.setSharedURLCache(urlCache)
        
        //初始化图片模块缓存设置
        imageCacheManager.maxDiskCacheSize = 250 * 1024 * 1024
        imageCacheManager.maxCachePeriodInSecond = 60 * 60 * 24 * 30
        
        //初始化日志模块设置
        let cacheDirectory: NSURL = {
            let urls = NSFileManager.defaultManager().URLsForDirectory(.CachesDirectory, inDomains: .UserDomainMask)
            return urls[urls.endIndex - 1]
        }()
        let logPath: NSURL = cacheDirectory.URLByAppendingPathComponent("SLRuntime.log")
        log.setup(.Info, showThreadName: true, showLogLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: logPath, fileLogLevel: .Debug)
        
        
    }
}
