//
//  SLCacheManager.swift
//  BigFactory
//
//  Created by huangqiang on 12/10/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit
import Kingfisher

let imageCacheManager = KingfisherManager.sharedManager.cache
let imageCache = ImageCache(name: "image_cache")

class SLCacheManager: NSObject {
    
    static let sharedInstance = SLCacheManager()
    private override init() {}
    
    func calculateDiskCacheSize(completionHandler: ((size: CGFloat) -> ())?){
        imageCacheManager.calculateDiskCacheSizeWithCompletionHandler { (size) -> () in
            print("disk size in bytes: \(size)")
            completionHandler?(size: CGFloat(size))
        }
    }
    
    func cleanAllCache(){
        
        imageCacheManager.clearMemoryCache()
        imageCacheManager.clearDiskCache()
        imageCacheManager.cleanExpiredDiskCache()
    }
    
}
