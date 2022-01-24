//
//  CacheEntry.swift
//  last.fm
//
//  Created by admin on 23.1.22..
//

import Foundation

final class CacheEntry<V> {
    
    let key: String
    let value: V
    let expiredTimestamp: Date
    
    init(key: String, value: V, expiredTimestamp: Date){
        self.key = key
        self.value = value
        self.expiredTimestamp = expiredTimestamp
    }
    
    
    func isCacheExpired(after date: Date) -> Bool {
        date > expiredTimestamp
    }
    
    
}
