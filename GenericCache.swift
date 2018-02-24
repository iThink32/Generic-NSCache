//
//  GenericCache.swift
//
//  Created by N A Shashank on 2/12/18.
//  Copyright © 2018 N A Shashank. All rights reserved.
//

import UIKit

public class GenericCache<cacheObjectType> where cacheObjectType:AnyObject {
    
    let cache = NSCache<NSString,cacheObjectType>()
    
    public func fetchObject(name:String) -> cacheObjectType? {
        return cache.object(forKey: name as NSString)
    }
    
    public func saveObject(obj1:cacheObjectType,name:String) {
        self.cache.setObject(obj1, forKey: NSString(string:name))
    }
    
    public init() {
        // nothing to do here
    }
    
    
}
