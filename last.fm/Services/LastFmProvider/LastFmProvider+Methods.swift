//
//  LastFmProvider+Methods.swift
//  last.fm
//
//  Created by admin on 21.1.22..
//

import Foundation

extension LastFmProvider {
    struct LastFmMethod {
        let string: String

        enum geo {
            static let gettopartists = LastFmMethod(string: "geo.gettopartists")
        }
        
        enum artist {
            static let getInfo = LastFmMethod(string: "artist.getInfo")
        }
    }
}
