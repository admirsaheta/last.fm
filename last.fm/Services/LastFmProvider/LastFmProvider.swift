//
//  LastFmProvider.swift
//  last.fm
//
//  Created by admin on 21.1.22..
//

import Foundation
import APIProvider

class LastFmProvider: APIProvider {
    
    internal func fetch<T: Decodable>(method: LastFmMethod, query: [String : Any], decode: T.Type) async throws -> T {
        var q: [String : Any] = [
            "method": method.string,
        ]
        
        query.forEach { item in
            q[item.key] = item.value
        }
        
        let response = try await fetch(
            method: .get(q),
            decode: T.self,
            cacheMethod: .persistent(2 * 60)
        )
        
        return response
    }
}
